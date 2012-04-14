require 'spec_helper'

module FarmGame
  describe Game do
    let(:output) { StringIO.new }
    let(:input) { StringIO.new }

    subject do
      Game.new output, input
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
      before do
        subject.expects :take_turns
        subject.play
      end

      it "should welcome the user to the game" do
        output.string.should include("Welcome")
      end

      it "should create two players" do
        subject.should have(2).players
        players = subject.players
        players[0].name.should be == '1'
        players[1].name.should be == '2'
      end

      it "should position all players on the first square" do
        subject.players_for_square(subject.squares.first).should have(2).players
      end

      it "should set the first player as active" do
        subject.active_player.should be subject.players[0]
      end

      describe "#finish_turn" do
        it "should cyclicly progress to the next player" do
          subject.finish_turn
          subject.active_player.should be subject.players[1]
          subject.finish_turn
          subject.active_player.should be subject.players[0]
          subject.finish_turn
          subject.active_player.should be subject.players[1]
        end
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

    describe "#roll_and_move" do
      it "should move the active player by the result of a dice roll" do
        player = Player.new :square => subject.squares[0]
        subject.players << player
        subject.die.expects(:roll).returns(2)
        subject.roll_and_move
        subject.players_for_square(subject.squares[2]).should include(player)
      end
    end
  end
end
