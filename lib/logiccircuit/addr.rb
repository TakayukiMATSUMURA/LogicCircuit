#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
module LogicCircuit
  class Addr < Element
    attr_reader :c, :s
  end
  
  class HalfAddr < Addr
    def outputs
      [@c ||= And.new(@inputs[0], @inputs[1]),
       @s ||= Xor.new(@inputs[0], @inputs[1])]
    end
  end
  
  class FullAddr < Addr
    def initialize a, b, x
      addr0 = HalfAddr.new a, b
      addr1 = HalfAddr.new x, addr0.s
      @s = addr1.s
      @c = Or.new addr0.c, addr1.c
      super
    end
    
    def outputs
      [@c, @s]
    end
  end
end
