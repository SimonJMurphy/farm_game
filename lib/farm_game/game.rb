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
      @active_player_id = 0
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
      create_players
      board.print output
    end

    def players_for_square(square)
      players.players_for_square square
    end

    def move_player(player, distance)
      player.square = squares[new_position(player, distance)]
    end

    def active_player
      players[@active_player_id]
    end

    def finish_turn
      @active_player_id += 1
      @active_player_id -= players.size if @active_player_id == players.size
    end

    private

    attr_reader :output

    def create_players
      %w{1 2}.each { |name| players << Player.new(:name => name, :square => squares.first) }
    end

    def position_for_square(square)
      squares.index(square)
    end

    def new_position(player, distance)
      pos = position_for_square(player.square) + distance
      pos -= 40 if pos > 39
      pos
    end
  end
end
