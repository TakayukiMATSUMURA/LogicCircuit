#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
using LogicCircuit::Boolean

module LogicCircuit
  class Addr < Element
    undef output
  end
  
  class HalfAddr < Addr
    attr_reader :c, :s
    
    def initialize a, b
      @c = And.new(a, b)
      @s = And.new Or.new(a, b), Not.new(@c)
      @implement = [@s, @c]
      super
    end
  end
end
