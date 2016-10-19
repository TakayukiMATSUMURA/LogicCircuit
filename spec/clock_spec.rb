require "spec_helper"

module LogicCircuit
  describe Clock do
    it "outputs 0 when constructed with no argument" do
      clock = Clock.new
      expect(clock.output).to eq(0)
    end
    it "outputs 1 after tick" do
      clock = Clock.new
      clock.tick
      expect(clock.output).to eq(1)
    end
    it "outputs 1 after tack" do
      clock = Clock.new
      clock.tick
      clock.tack
      expect(clock.output).to eq(0)
    end
  end
end
