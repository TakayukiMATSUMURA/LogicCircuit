require "spec_helper"
using LogicCircuit::Boolean

module LogicCircuit
  module FlipFlop
    describe RS do
      it "outputs 1 when s = 1 and r = 0" do
        r = Wire.new
        s = Wire.new 1
        f = RS.new r, s
        expect(f.output.to_i).to eq(1)
      end
      it "outputs 1 when s = 1 and r = 0 and then s = 0" do
        r = Wire.new
        s = Wire.new 1
        f = RS.new r, s
        s = Wire.new 0
        expect(f.output.to_i).to eq(1)
      end
      it "outputs 0 when s = 0 and r = 1" do
        r = Wire.new 1
        s = Wire.new
        f = RS.new r, s
        expect(f.output.to_i).to eq(0)
      end
      it "outputs 0 when s = 0 and r = 1 and then r = 0" do
        r = Wire.new 1
        s = Wire.new
        f = RS.new r, s
        r = 0
        expect(f.output.to_i).to eq(0)
      end
    end
  end
end  
