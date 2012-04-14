module FarmGame
  class PlayerCollection < Array
    def players_for_square(square)
      find_all { |player| player.square == square }
    end
  end
end
