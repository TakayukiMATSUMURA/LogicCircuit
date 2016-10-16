#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
module LogicCircuit
  module FlipFlop
    class Base < Element
    end
    
    class RS < Base
      def initialize r, s
        @snand = Nand.new Not.new(s),
                          Nand.new(Not.new(r), self)
        super
      end
      
      def drive
        @snand.drive
      end
    end
    
    class JK < Base
      def initialize j, k, clock
        @jnand = Nand.new Nand.new(j, clock, Not.new(self)),
                          Nand.new(self, Nand.new(k, clock, self))
        super
      end
      
      def drive
        @jnand.drive
      end
    end
  end
end
