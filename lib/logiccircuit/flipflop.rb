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
  end
end
