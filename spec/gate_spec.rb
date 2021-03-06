require "spec_helper"

module LogicCircuit
  describe Nand do
    it "outputs 0 if all inputs are 1" do
      a = Wire.new
      b = Wire.new
      
      nand = Nand.new a, b
      a.input = 1
      b.input = 1
      expect(nand.output).to eq(0)
    end
    it "outputs 1 if any input is 0" do
      a = Wire.new
      b = Wire.new
      
      nand = Nand.new a, b
      expect(nand.output).to eq(1)
      a.input = 1
      expect(nand.output).to eq(1)
      a.input = 0
      b.input = 1
      expect(nand.output).to eq(1)
    end
  end
  
  describe Not do
    it "outputs 1 if input is 0" do
      a = Wire.new
      n = Not.new a
      expect(n.output).to eq(1)
    end
    it "outputs 0 if input is 1" do
      a = Wire.new 1
      n = Not.new a
      expect(n.output).to eq(0)
    end
  end
  
  describe And do
    it "outputs 0 if any input is 0" do
      x = Wire.new
      y = Wire.new
      a = And.new x, y
      expect(a.output).to eq(0)
      x.input = 1
      expect(a.output).to eq(0)
      x.input = 0
      y.input = 1
      expect(a.output).to eq(0)
    end
    it "outputs 1 if all inputs are 1" do
      x = Wire.new 1
      y = Wire.new 1
      a = And.new x, y
      expect(a.output).to eq(1)
    end
  end

  describe Or do
    it "outputs 0 if all inputs are 0" do
      a = Wire.new
      b = Wire.new
      o = Or.new a, b
      expect(o.output).to eq(0)
    end
    it "outputs 1 if any input is 1" do
      a = Wire.new 1
      b = Wire.new
      o = Or.new a, b
      expect(o.output).to eq(1)
      a.input = 0
      b.input = 1
      expect(o.output).to eq(1)
      a.input = 1
      expect(o.output).to eq(1)
    end
  end
  
  describe Nor do
    it "outputs 1 if all inputs are 0" do
      a = Wire.new
      b = Wire.new
      e = Nor.new a, b
      expect(e.output).to eq(1)
    end
    it "outputs 0 if any input is 1" do
      a = Wire.new 1
      b = Wire.new
      e = Nor.new a, b
      expect(e.output).to eq(0)
      a.input = 0
      b.input = 1
      expect(e.output).to eq(0)
    end
  end
  
  describe Xor do
    it "outputs 0 if even inputs are 1" do
      a = Wire.new
      b = Wire.new
      c = Wire.new
      e = Xor.new a, b, c
      expect(e.output).to eq(0)
      a.input = 1
      b.input = 1
      expect(e.output).to eq(0)
      a.input = 0
      c.input = 1
      expect(e.output).to eq(0)
      b.input = 0
      a.input = 1
      expect(e.output).to eq(0)
    end
    it "outputs 0 if odd inputs are 1" do
      a = Wire.new 1
      b = Wire.new
      c = Wire.new
      e = Xor.new a, b, c
      expect(e.output).to eq(1)
      a.input = 0
      b.input = 1
      expect(e.output).to eq(1)
      b.input = 0
      c.input = 1
      expect(e.output).to eq(1)
      a.input = 1
      b.input = 1
      expect(e.output).to eq(1)
    end
  end
end
