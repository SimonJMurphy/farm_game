require 'spec_helper'

module FarmGame
  describe PlayerCollection do
    it { should be_a Array }

    context "with 4 players" do
      before do
        5.times do |n|
          subject << Player.new(n.to_s)
        end
      end

      context "where players are on squares" do
        let(:square1) { Square.new }
        let(:square2) { Square.new }
        let(:square3) { Square.new }
        let(:square4) { Square.new }

        before do
          subject[1].square = square1
          subject[2].square = square1
          subject[3].square = square2
          subject[4].square = square3
        end

        it "should know which players are on a particular square" do
          subject.players_for_square(square1).should be == [subject[1], subject[2]]
          subject.players_for_square(square2).should be == [subject[3]]
          subject.players_for_square(square3).should be == [subject[4]]
          subject.players_for_square(square4).should be == []
        end
      end
    end
  end
end
