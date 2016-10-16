#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
module LogicCircuit
  module FlipFlop
    class Base < Element
    end
    
    class RS < Base
      def initialize r, s
        @r, @s = r, s
        
        @snand = Nand.new Not.new(@s)
        rnand = Nand.new Not.new(@r), @snand
        @snand << rnand
        
        super
        @output = drive
        @inputs.each{|input| input.add_observer self}
      end
      
      def drive
        @snand.drive
      end
    end
  end
end
