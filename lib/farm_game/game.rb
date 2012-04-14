module FarmGame
  class Game
    def board
      @board ||= Board.new
    end

    def die
      @die ||= Die.new
    end

    def players
      @players ||= PlayerCollection.new
    end
  end
end
