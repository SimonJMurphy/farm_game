require 'spec_helper'

module FarmGame
  describe Game do
    let(:stringio) { StringIO.new }

    subject do
      Game.new stringio
    end

    its(:board) { should be_a FarmGame::Board }

    it "should always use the same board" do
      subject.board.should be subject.board
    end

    it "s board should know its game" do
      subject.board.game.should be subject
    end

    it { should have(40).squares }

    its :squares do
      subject.all? { |s| s.should be_a FarmGame::Square }
    end

    its(:die) { should be_a FarmGame::Die }

    its(:players) { should be_a FarmGame::PlayerCollection }
    it { should have(0).players }

    describe "#play" do
      it "should welcome the user to the game" do
        subject.play
        stringio.string.should include("Welcome")
      end
    end

    describe "#players_for_square" do
      it "should delegate to the players collection" do
        square = Square.new
        player = Player.new :square => square
        subject.players << player
        subject.players_for_square(square).should be == [player]
      end
    end

    describe "#move_player" do
      it "should move the specified player forward by the number of squares specified" do
        player = Player.new
        subject.players << player
        player.square = subject.squares[1]
        subject.move_player player, 4
        subject.players_for_square(subject.squares[1]).should_not include(player)
        subject.players_for_square(subject.squares[5]).should include(player)
      end
    end
  end
end
