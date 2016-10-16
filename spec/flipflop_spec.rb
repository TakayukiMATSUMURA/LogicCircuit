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

    describe JK do
      it "outputs 1 when j = 1 and k = 0" do
        clock = Wire.new
        j = Wire.new 1
        k = Wire.new
        f = JK.new j, k, clock
        clock.input = 1
        expect(f.output.to_i).to eq(1)
      end
      it "outputs 0 when j = 0 and k = 1" do
        clock = Wire.new
        j = Wire.new
        k = Wire.new 1
        f = JK.new j, k, clock
        clock.input = 1
        expect(f.output.to_i).to eq(0)
      end
      it "outputs 0 when j = 1 and k = 0 and then j = k = 1" do
        clock = Wire.new
        j = Wire.new 1
        k = Wire.new
        f = JK.new j, k, clock
        clock.input = 1
        expect(f.output.to_i).to eq(1)
        clock.input = 0
        k.input = 1
        clock.input = 1
        expect(f.output.to_i).to eq(0)
      end
      it "outputs 1 when j = 0 and k = 1 and then j = k = 1" do
        clock = Wire.new
        j = Wire.new
        k = Wire.new 1
        f = JK.new j, k, clock
        clock.input = 1
        expect(f.output.to_i).to eq(0)
        clock.input = 0
        j.input = 1
        clock.input = 1
        expect(f.output.to_i).to eq(1)
      end
    end
    
    describe T do
      it "outputs 1 when output was 0 and then clock = 1" do
        clock = Wire.new
        t = T.new clock
        clock.input = 1
        expect(t.output.to_i).to eq(1)
      end
      it "outputs 0 when output was 1 and then clock = 1" do
        clock = Wire.new
        t = T.new clock
        clock.input = 1
        clock.input = 0
        clock.input = 1
        expect(t.output.to_i).to eq(0)
      end
    end
  end
end  
