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
    
    def drive
      outputs.map(&:output)
    end
    
    def update
      new_outputs = drive
      if new_outputs.zip(@outputs).any?{|a, b| a != b}
        @outputs = new_outputs
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
