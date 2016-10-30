require "spec_helper"

module LogicCircuit
  describe HalfAdder do
    it "outputs s = 0, c = 0 when both inputs are 0" do
      a = Wire.new
      b = Wire.new
      h = HalfAdder.new a, b
      expect(h.s.output).to eq(0)
      expect(h.c.output).to eq(0)
    end
    it "outputs s = 1, c = 0 when one input is 1" do
      a = Wire.new 1
      b = Wire.new
      h = HalfAdder.new a, b
      expect(h.s.output).to eq(1)
      expect(h.c.output).to eq(0)
      a.input = 0
      b.input = 1
      expect(h.s.output).to eq(1)
      expect(h.c.output).to eq(0)
    end
    it "outputs s = 0, c = 1 when both inputs are 1" do
      a = Wire.new 1
      b = Wire.new 1
      h = HalfAdder.new a, b
      expect(h.s.output).to eq(0)
      expect(h.c.output).to eq(1)
    end
  end
  describe FullAdder do
    it "outputs s = 0, c = 0 when all inputs are 0" do
      a = Wire.new
      b = Wire.new
      c = Wire.new
      f = FullAdder.new a, b, c
      expect(f.s.output).to eq(0)
      expect(f.c.output).to eq(0)
    end
    it "outputs s = 1, c = 0 when one input is 1" do
      a = Wire.new 1
      b = Wire.new
      c = Wire.new
      f = FullAdder.new a, b, c
      expect(f.s.output).to eq(1)
      expect(f.c.output).to eq(0)
      a.input = 0
      b.input = 1
      expect(f.s.output).to eq(1)
      expect(f.c.output).to eq(0)
      b.input = 0
      c.input = 1
      expect(f.s.output).to eq(1)
      expect(f.c.output).to eq(0)
    end
    it "outputs s = 0, c = 1 when two inputs are 1" do
      a = Wire.new 1
      b = Wire.new 1
      c = Wire.new
      f = FullAdder.new a, b, c
      expect(f.s.output).to eq(0)
      expect(f.c.output).to eq(1)
      a.input = 0
      c.input = 1
      expect(f.s.output).to eq(0)
      expect(f.c.output).to eq(1)
      b.input = 0
      a.input = 1
      expect(f.s.output).to eq(0)
      expect(f.c.output).to eq(1)
    end
    it "outputs s = 1, c = 1 when all inputs are 1" do
      a = Wire.new 1
      b = Wire.new 1
      c = Wire.new 1
      f = FullAdder.new a, b, c
      expect(f.s.output).to eq(1)
      expect(f.c.output).to eq(1)
    end
  end
end
