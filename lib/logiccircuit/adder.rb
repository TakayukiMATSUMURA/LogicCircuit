#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
module LogicCircuit
  class Adder < Element
    attr_reader :c, :s
  end
  
  class HalfAdder < Adder
    def outputs
      [@c ||= And.new(@inputs[0], @inputs[1]),
       @s ||= Xor.new(@inputs[0], @inputs[1])]
    end
  end
  
  class FullAdder < Adder
    def initialize a, b, x
      addr0 = HalfAdder.new a, b
      addr1 = HalfAdder.new x, addr0.s
      @s = addr1.s
      @c = Or.new addr0.c, addr1.c
      super
    end
    
    def outputs
      [@c, @s]
    end
  end
end
