module FarmGame
  class Game
    def initialize(output)
      @output = output
    end

    def board
      @board ||= Board.new
    end

    def die
      @die ||= Die.new
    end

    def players
      @players ||= PlayerCollection.new
    end

    def play
      board.print output
    end

    private

    attr_reader :output
  end
end
