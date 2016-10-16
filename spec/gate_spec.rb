require "spec_helper"
using LogicCircuit::Boolean

module LogicCircuit
  describe Nand do
    it "outputs 0 if all inputs are 1" do
      a = Wire.new
      b = Wire.new
      
      nand = Nand.new a, b
      a.input = 1
      b.input = 1
      expect(nand.output.to_i).to eq(0)
    end
    it "outputs 1 if any input is 0" do
      a = Wire.new
      b = Wire.new
      
      nand = Nand.new a, b
      expect(nand.output.to_i).to eq(1)
      a.input = 1
      expect(nand.output.to_i).to eq(1)
      a.input = 0
      b.input = 1
      expect(nand.output.to_i).to eq(1)
    end
  end
  
  describe Not do
    it "outputs 1 if input is 0" do
      a = Wire.new
      n = Not.new a
      expect(n.output.to_i).to eq(1)
    end
    it "outputs 0 if input is 1" do
      a = Wire.new 1
      n = Not.new a
      expect(n.output.to_i).to eq(0)
    end
  end
end
