require 'spec_helper'

module FarmGame
  describe Player do
    it "should keep track of its square" do
      square = Square.new
      alt_square = Square.new
      subject.square = square
      subject.square.should be == square
      subject.square.should_not be == alt_square
    end
  end
end
