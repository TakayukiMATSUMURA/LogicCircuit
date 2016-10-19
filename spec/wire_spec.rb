require "spec_helper"

module LogicCircuit
  describe Wire do
    it "outputs 0 when constructed with no argument" do
      w = Wire.new
      expect(w.output).to eq(0)
    end
    it "outputs 0 when constructed with 1" do
      w = Wire.new 1
      expect(w.output).to eq(1)
    end
    
    it "outputs 0 when constructed with 1 and assigned 0" do
      w = Wire.new 1
      w.input = 0
      expect(w.output).to eq(0)
    end
    it "outputs 1 when constructed with 0 and assigned 1" do
      w = Wire.new 0
      w.input = 1
      expect(w.output).to eq(1)
    end
  end
end
