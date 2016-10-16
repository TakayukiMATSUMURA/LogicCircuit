require "spec_helper"
using LogicCircuit::Boolean

module LogicCircuit
  describe Boolean do
    it "refines TrueClass(true.to_i == 1)" do
      expect(true.to_i).to eq(1)
    end
    it "refines TrueClass(true.to_s == '1')" do
      expect(true.to_s).to eq('1')
    end
    
    it "refines FalseClass(false.to_i == 0)" do
      expect(false.to_i).to eq(0)
    end
    it "refines FalseClass(false.to_s == '0')" do
      expect(false.to_s).to eq('0')
    end
  end
end
