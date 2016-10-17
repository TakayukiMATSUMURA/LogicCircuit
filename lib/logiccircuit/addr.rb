#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
using LogicCircuit::Boolean

module LogicCircuit
  class Addr < Element
    undef output
  end
  
  class HalfAddr < Addr
    def initialize a, b
      @c = And.new(a, b)
      @s = And.new Or.new(a, b), Not.new(@c)
      super
    end
    
    def drive
      [@c.drive, @s.drive]
    end
    
    def c
      @coutput ||= Wire.new(@c.output)
    end
    def s
      @soutput ||= Wire.new(@s.output)
    end
  end
end
