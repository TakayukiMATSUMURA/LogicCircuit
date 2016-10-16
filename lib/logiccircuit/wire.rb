#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
require 'observer'

module LogicCircuit
  class Wire
    include Observable
    
    attr_reader :output
    
    def initialize input = false
      @output = input
    end
    
    def input= input
      return if @output == input
      @output = input
      changed
      notify_observers
    end
  end
end
