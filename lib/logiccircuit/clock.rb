#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
module LogicCircuit
  class Clock < Wire
    def initialize
      @output = 0
    end
    
    def tick; self.input = 1; end
    def tack; self.input = 0; end
  end
end
