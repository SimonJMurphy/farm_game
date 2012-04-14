module FarmGame
  class Game
    SQUARE_NAMES = [
      'Start',
      'Poultry',
      'Vegetables',
      'Supplies',
      'Fruit Tree',
      'Livestock',
      '<=6 Goats',
      'Breeding',
      'Crops',
      '<=3 Cows',
      'Crops',
      'Poultry',
      '<=2 Ewes',
      'Supplies',
      'Nursery',
      'Vegetables',
      'Ram',
      'Pot Luck',
      'Vegetables',
      '1 Cow',
      'Fruit',
      'Poultry',
      'Crops',
      'Supplies',
      'Fruit Tree',
      'Livestock',
      '<=4 Ewes',
      'Breeding',
      'Vegetables',
      '<=2 Cows',
      'Crops',
      'Poultry',
      'Goats 2',
      'Supplies',
      'Forest',
      'Vegetables',
      'Billy Goat',
      'Pot Luck',
      'Crops',
      'Bull'
    ]

    attr_reader :squares

    def initialize(output = STDOUT)
      @output = output
      @squares = []
      SQUARE_NAMES.each { |name| @squares << Square.new(:name => name) }
    end

    def board
      @board ||= Board.new(self)
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

    def players_for_square(square)
      players.players_for_square square
    end

    def move_player(player, distance)
      new_position = position_for_square(player.square) + distance
      player.square = squares[new_position]
    end

    private

    attr_reader :output

    def position_for_square(square)
      squares.index(square)
    end
  end
end
