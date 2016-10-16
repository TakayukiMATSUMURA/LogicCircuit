#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
require 'observer'

using LogicCircuit::Boolean

module LogicCircuit
  class Wire
    include Observable
    
    attr_reader :output
    
    def initialize input = false
      @output = input.to_b
    end
    
    def input= input
      return if @output == input.to_b
      @output = input.to_b
      changed
      notify_observers
    end
  end
end
