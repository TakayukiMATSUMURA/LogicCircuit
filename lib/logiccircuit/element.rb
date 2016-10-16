#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
require 'observer'

module LogicCircuit
  class Element
    include Observable
    
    attr_reader :output
    
    def initialize *inputs
      @inputs = [*inputs].flatten
      @output = drive
      @inputs.each{|input| input.add_observer self}
    end
    
    def << input
      @inputs << input
      @output = drive
      input.add_observer self
    end
    
    def drive
      @implement.drive
    end
    
    def update
      output = drive
      if output != @output
        @output = output
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
