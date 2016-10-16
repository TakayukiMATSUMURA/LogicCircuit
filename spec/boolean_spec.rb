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
    it "refines TrueClass(true.to_b == true)" do
      expect(true.to_b).to eq(true)
    end
    
    it "refines FalseClass(false.to_i == 0)" do
      expect(false.to_i).to eq(0)
    end
    it "refines FalseClass(false.to_s == '0')" do
      expect(false.to_s).to eq('0')
    end
    it "refines FalseClass(false.to_b == false)" do
      expect(false.to_b).to eq(false)
    end

    it "refines Integer(0.to_b == false)" do
      expect(0.to_b).to eq(false)
    end
    it "refines Integer(1.to_b == true)" do
      expect(1.to_b).to eq(true)
    end
  end
end
