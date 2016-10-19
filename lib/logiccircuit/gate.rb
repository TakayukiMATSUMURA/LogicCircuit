#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
module LogicCircuit
  class Gate < Element
  end
  
  class Nand < Gate
    def drive
      [!(@inputs.all?{|input| input.output == 1}) ? 1 : 0]
    end
  end
  
  class Not < Gate
    def impl
      @impl ||= Nand.new @inputs[0]
    end
  end
  
  class And < Gate
    def impl
      @impl ||= Nand.new Nand.new(@inputs)
    end
  end
  
  class Or < Gate
    def impl
      @impl ||= Nand.new @inputs.map{|input| Nand.new input}
    end
  end
  
  class Nor < Gate
    def impl
      @impl ||= Not.new Or.new(@inputs)
    end
  end
  
  class Xor < Gate
    def impl
      @impl ||= @inputs.inject{|xor, input| Xor2inputs.new xor, input}
    end
    
    private
    class Xor2inputs < Gate
      def initialize a, b
        @a, @b = a, b
        super
      end
      
      def impl
        @impl ||= And.new Nand.new(@a, @b), Or.new(@a, @b)
      end
    end
  end
end
