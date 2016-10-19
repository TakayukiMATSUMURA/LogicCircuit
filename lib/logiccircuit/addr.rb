#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
using LogicCircuit::Boolean

module LogicCircuit
  class Addr < Element
    undef output
    attr_reader :c, :s
  end
  
  class HalfAddr < Addr
    def initialize a, b
      @c = And.new a, b
      @s = And.new Or.new(a, b), Not.new(c)
      super
    end
    
    def impl
      [@c, @s]
    end
  end
  
  class FullAddr < Addr
    def initialize a, b, x
      addr = HalfAddr.new a, b
      @addr = HalfAddr.new x, addr.s
      @s = @addr.s
      @c = Or.new addr.c, @addr.c
      super
    end
    
    def impl
      [@c, @addr]
    end
  end
end
