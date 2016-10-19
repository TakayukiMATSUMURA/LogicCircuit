#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
require 'observer'

module LogicCircuit
  class Element
    include Observable
    
    def initialize *inputs
      @inputs = [*inputs].flatten
      @outputs = drive
      @inputs.each{|input| input.add_observer self}
    end
    
    def output
      (@outputs ||= [])[0]
    end
    
    def drive
      [impl].flatten.flat_map(&:drive)
    end
    
    def update
      outputs = drive
      if outputs.zip(@outputs).any?{|a, b| a != b}
        @outputs = outputs
        changed
        notify_observers
      end
    end

    def to_s
      (@name ||= self.class.name.split("::").last).downcase +
        " in:#{@inputs.map{|input| input.output.to_i}.join}" +
        " out:#{@output.to_i} "
    end
  end
end
