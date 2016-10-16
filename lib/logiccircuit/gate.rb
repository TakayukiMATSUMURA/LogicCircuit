#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
module LogicCircuit
  class Gate < Element
  end
  
  class Nand < Gate
    def drive
      !(@inputs.all?(&:output))
    end
  end
  
  class Not < Gate
    def initialize input
      @implement = Nand.new input
      super
    end
  end
  
  class And < Gate
    def initialize *inputs
      @implement = Nand.new(Nand.new *inputs)
      super
    end
  end
  
  class Or < Gate
    def initialize *inputs
      @implement = Nand.new *inputs.map{|input| Nand.new input}
      super
    end
  end
end
