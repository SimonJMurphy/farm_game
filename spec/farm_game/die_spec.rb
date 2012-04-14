require 'spec_helper'

module FarmGame
  describe Die do
    describe "#roll" do
      it "should return an integer" do
        subject.roll.should be_a Integer
      end

      it "should not be less than 1" do
        100.times do
          subject.roll.should be >= 1
        end
      end

      it "should not be more than 6" do
        100.times do
          subject.roll.should be <= 6
        end
      end

      it "should produce the full range of possibilities" do
        rolls = []
        100.times { rolls << subject.roll }
        rolls.uniq.count.should be == 6
      end
    end
  end
end
