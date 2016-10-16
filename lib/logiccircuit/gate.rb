#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
using LogicCircuit::Boolean

module LogicCircuit
  class Gate
    include Observable
    
    attr_reader :output
    
    def initialize *inputs
      @inputs = [*inputs].flatten
      @output = drive
      @inputs.each{|input| input.add_observer self}
    end
    
    def to_s
      (@name ||= self.class.name.split("::").last).downcase +
        " in:#{@inputs.map{|input| input.output.to_i}.join}" +
        " out:#{@output.to_i} "
    end
    
    def update
      output = drive
      if output != @output
        @output = output
        changed
        notify_observers
      end
    end
  end
  
  class Nand < Gate
    def drive
      !(@inputs.all?(&:output))
    end
  end
end
