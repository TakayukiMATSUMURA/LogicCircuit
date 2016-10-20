#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
module LogicCircuit
  class Gate < Element
    def output
      @outputs[0]
    end
  end
  
  class Nand < Gate
    def drive
      [!(@inputs.all?{|input| input.output == 1}) ? 1 : 0]
    end
  end
  
  class Not < Gate
    def outputs
      [@not ||= Nand.new(@inputs[0])]
    end
  end
  
  class And < Gate
    def outputs
      [@and ||= Nand.new(Nand.new(@inputs))]
    end
  end
  
  class Or < Gate
    def outputs
      [@or ||= Nand.new(@inputs.map{|input| Nand.new input})]
    end
  end
  
  class Nor < Gate
    def outputs
      [@nor ||= Not.new(Or.new(@inputs))]
    end
  end
  
  class Xor < Gate
    def outputs
      [@xor ||= @inputs.inject{|xor, input| Xor2inputs.new xor, input}]
    end
    
    private
    class Xor2inputs < Gate
      def outputs
        [@xor ||= And.new(Nand.new(@inputs[0], @inputs[1]),
                          Or.new(@inputs[0], @inputs[1]))]
      end
    end
  end
end
