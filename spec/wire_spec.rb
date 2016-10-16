require "spec_helper"
require 'logiccircuit/wire'

module LogicCircuit
  describe Wire do
    it "constructed with no argument has false output" do
      w = Wire.new
      expect(w.output).to eq(false)
    end
    it "constructed with true has true output" do
      w = Wire.new true
      expect(w.output).to eq(true)
    end
    
    it "constructed with true and assigned false has false output" do
      w = Wire.new true
      w.input = false
      expect(w.output).to eq(false)
    end
    it "constructed with false and assigned true has true output" do
      w = Wire.new false
      w.input = true
      expect(w.output).to eq(true)
    end
  end
end
