require 'spec_helper'

module FarmGame
  describe Game do
    its(:board) { should be_a FarmGame::Board }

    it "should always use the same board" do
      subject.board.should be subject.board
    end

    its(:die) { should be_a FarmGame::Die }

    its(:players) { should be_a FarmGame::PlayerCollection }
    it { should have(0).players }
  end
end
