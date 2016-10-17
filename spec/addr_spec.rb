require "spec_helper"

using LogicCircuit::Boolean

module LogicCircuit
  describe HalfAddr do
    it "outputs s = 0, c = 0 when both inputs are 0" do
      a = Wire.new
      b = Wire.new
      h = HalfAddr.new a, b
      expect(h.s.output.to_i).to eq(0)
      expect(h.c.output.to_i).to eq(0)
    end
    it "outputs s = 1, c = 0 when one input is 1" do
      a = Wire.new 1
      b = Wire.new
      h = HalfAddr.new a, b
      expect(h.s.output.to_i).to eq(1)
      expect(h.c.output.to_i).to eq(0)
      a.input = 0
      b.input = 1
      expect(h.s.output.to_i).to eq(1)
      expect(h.c.output.to_i).to eq(0)
    end
    it "outputs s = 0, c = 1 when both inputs are 1" do
      a = Wire.new 1
      b = Wire.new 1
      h = HalfAddr.new a, b
      expect(h.s.output.to_i).to eq(0)
      expect(h.c.output.to_i).to eq(1)
    end
  end
  describe FullAddr do
    it "outputs s = 0, c = 0 when all inputs are 0" do
      a = Wire.new
      b = Wire.new
      c = Wire.new
      f = FullAddr.new a, b, c
      expect(f.s.output.to_i).to eq(0)
      expect(f.c.output.to_i).to eq(0)
    end
    it "outputs s = 1, c = 0 when one input is 1" do
      a = Wire.new 1
      b = Wire.new
      c = Wire.new
      f = FullAddr.new a, b, c
      expect(f.s.output.to_i).to eq(1)
      expect(f.c.output.to_i).to eq(0)
      a.input = 0
      b.input = 1
      expect(f.s.output.to_i).to eq(1)
      expect(f.c.output.to_i).to eq(0)
      b.input = 0
      c.input = 1
      expect(f.s.output.to_i).to eq(1)
      expect(f.c.output.to_i).to eq(0)
    end
    it "outputs s = 0, c = 1 when two inputs are 1" do
      a = Wire.new 1
      b = Wire.new 1
      c = Wire.new
      f = FullAddr.new a, b, c
      expect(f.s.output.to_i).to eq(0)
      expect(f.c.output.to_i).to eq(1)
      a.input = 0
      c.input = 1
      expect(f.s.output.to_i).to eq(0)
      expect(f.c.output.to_i).to eq(1)
      b.input = 0
      a.input = 1
      expect(f.s.output.to_i).to eq(0)
      expect(f.c.output.to_i).to eq(1)
    end
    it "outputs s = 1, c = 1 when all inputs are 1" do
      a = Wire.new 1
      b = Wire.new 1
      c = Wire.new 1
      f = FullAddr.new a, b, c
      expect(f.s.output.to_i).to eq(1)
      expect(f.c.output.to_i).to eq(1)
    end
  end
end
