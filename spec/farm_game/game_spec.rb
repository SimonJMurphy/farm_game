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

      it "should create two players" do
        subject.play
        subject.should have(2).players
        players = subject.players
        players[0].name.should be == '1'
        players[1].name.should be == '2'
      end

      it "should position all players on the first square" do
        subject.play
        subject.players_for_square(subject.squares.first).should have(2).players
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
      let(:player) { Player.new }

      before { subject.players << player }

      it "should move the specified player forward by the number of squares specified" do
        player.square = subject.squares[1]
        subject.move_player player, 4
        subject.players_for_square(subject.squares[1]).should_not include(player)
        subject.players_for_square(subject.squares[5]).should include(player)
      end

      it "should count from the start once a player passes the start square" do
        player.square = subject.squares[39]
        subject.move_player player, 1
        subject.players_for_square(subject.squares[39]).should_not include(player)
        subject.players_for_square(subject.squares[0]).should include(player)
      end
    end
  end
end
