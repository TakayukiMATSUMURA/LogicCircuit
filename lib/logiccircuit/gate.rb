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
      @impl ||= Nand.new(@inputs[0])
    end
  end
  
  class And < Gate
    def impl
      @impl ||= Nand.new(Nand.new @inputs)
    end
  end
  
  class Or < Gate
    def impl
      @impl ||= Nand.new(@inputs.map{|input| Nand.new input})
    end
  end
end
