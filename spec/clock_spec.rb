require "spec_helper"
using LogicCircuit::Boolean

module LogicCircuit
  describe Clock do
    it "is initialized with false output" do
      clock = Clock.new
      expect(clock.output.to_i).to eq(0)
    end
    it "outputs 1 after tick" do
      clock = Clock.new
      clock.tick
      expect(clock.output.to_i).to eq(1)
    end
    it "outputs 1 after tack" do
      clock = Clock.new
      clock.tick
      clock.tack
      expect(clock.output.to_i).to eq(0)
    end
  end
end
