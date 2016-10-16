#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
module LogicCircuit
  class FlipFlop < Element
  end
  
  class RS < FlipFlop
    def initialize r, s
      @snand = Nand.new Not.new(s),
                        Nand.new(Not.new(r), self)
      super
    end
    
    def drive
      @snand.drive
    end
  end
  
  class JK < FlipFlop
    def initialize j, k, clock
      @jnand = Nand.new Nand.new(j, clock, Not.new(self)),
                        Nand.new(self, Nand.new(k, clock, self))
      super
    end
    
    def drive
      @jnand.drive
    end
  end
  
  class T < JK
    def initialize clock
      super Wire.new(1), Wire.new(1), clock
    end
  end
end
