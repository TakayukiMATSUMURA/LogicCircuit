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
      super
    end
    
    def drive
      (@gate ||= Nand.new @inputs[0]).drive
    end
  end
  
  class And < Gate
    def drive
      (@gate ||= Nand.new(Nand.new @inputs)).drive
    end
  end
  
  class Or < Gate
    def drive
      (@gate ||= Nand.new @inputs.map{|input| Nand.new input}).drive
    end
  end
end
