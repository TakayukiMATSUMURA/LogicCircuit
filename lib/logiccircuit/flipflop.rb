#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
module LogicCircuit
  class FlipFlop < Element
    def output
      (@outputs ||= [])[0]
    end
  end
  
  class RS < FlipFlop
    def initialize r, s
      @r, @s = r, s
      @outputs = [1]
      super
    end
    
    def outputs
      [@nand ||= Nand.new(Not.new(@s), Nand.new(Not.new(@r), self))]
    end
  end
  
  class JK < FlipFlop
    def initialize j, k, clock
      @j, @k, @clock = j, k, clock
      super
    end
    
    def outputs
      [@nand ||= Nand.new(Nand.new(@j, @clock, Not.new(self)),
                          Nand.new(self, Nand.new(@k, @clock, self)))]
    end
  end
  
  class T < JK
    def initialize clock
      super Wire.new(1), Wire.new(1), clock
    end
  end
end
