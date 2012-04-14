module FarmGame
  class Board
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

    def initialize
      @squares = []
      SQUARE_NAMES.each { |name| @squares << Square.new(:name => name) }
    end

    def print(output)
      `clear`
      output.puts <<-BOARD
|------------------------------------------------------------------------------------------------------------------------|
|  Market  |#{sqrname 11}|#{sqrname 12}|#{sqrname 13}|#{sqrname 14}|  Market  |#{sqrname 16}|#{sqrname 17}|#{sqrname 18}|#{sqrname 19}|  Market  |
|#{sqrname 10}|          |          |          |          |#{sqrname 15}|          |          |          |          |#{sqrname 20}|
|#{sqrplyrs 0}|#{sqrplyrs 0}|#{sqrplyrs 0}|#{sqrplyrs 0}|#{sqrplyrs 0}|#{sqrplyrs 0}|#{sqrplyrs 0}|#{sqrplyrs 0}|#{sqrplyrs 0}|#{sqrplyrs 0}|#{sqrplyrs 0}|
|..........|__________________________________________________________________________________________________|..........|
|#{sqrname 9}|                                                                                                  |#{sqrname 21}|
|          |                                                                                                  |          |
|#{sqrplyrs 0}|                                                                                                  |#{sqrplyrs 0}|
|..........|                                                                                                  |..........|
|#{sqrname 8}|                                                                                                  |#{sqrname 22}|
|          |                                                                                                  |          |
|#{sqrplyrs 0}|                                                                                                  |#{sqrplyrs 0}|
|..........|                                                                                                  |..........|
|#{sqrname 7}|                                            Welcome to                                            |#{sqrname 23}|
|          |                                            Farm  Game                                            |          |
|#{sqrplyrs 0}|                                              v#{FarmGame::VERSION}                                              |#{sqrplyrs 0}|
|..........|                                                                                                  |..........|
|#{sqrname 6}|                                                                                                  |#{sqrname 24}|
|          |                                                                                                  |          |
|#{sqrplyrs 0}|                                                                                                  |#{sqrplyrs 0}|
|..........|                                                                                                  |..........|
|  Market  |                                                                                                  |  Market  |
|#{sqrname 5}|                                                                                                  |#{sqrname 25}|
|#{sqrplyrs 0}|                                                                                                  |#{sqrplyrs 0}|
|..........|                                                                                                  |..........|
|#{sqrname 4}|                                                                                                  |#{sqrname 26}|
|          |                                                                                                  |          |
|#{sqrplyrs 0}|                                                                                                  |#{sqrplyrs 0}|
|..........|                                                                                                  |..........|
|#{sqrname 3}|                                                                                                  |#{sqrname 27}|
|          |                                                                                                  |          |
|#{sqrplyrs 0}|                                                                                                  |#{sqrplyrs 0}|
|..........|                                                                                                  |..........|
|#{sqrname 2}|                                                                                                  |#{sqrname 28}|
|          |                                                                                                  |          |
|#{sqrplyrs 0}|                                                                                                  |#{sqrplyrs 0}|
|..........|                                                                                                  |..........|
|#{sqrname 1}|                                                                                                  |#{sqrname 29}|
|          |                                                                                                  |          |
|#{sqrplyrs 0}|                                                                                                  |#{sqrplyrs 0}|
|..........|--------------------------------------------------------------------------------------------------|..........|
|#{sqrname 0}|#{sqrname 39}|#{sqrname 38}|#{sqrname 37}|#{sqrname 36}|  Market  |#{sqrname 34}|#{sqrname 33}|#{sqrname 32}|#{sqrname 31}|  Market  |
|          |          |          |          |          |#{sqrname 35}|          |          |          |          |#{sqrname 30}|
|#{sqrplyrs 0}|#{sqrplyrs 0}|#{sqrplyrs 0}|#{sqrplyrs 0}|#{sqrplyrs 0}|#{sqrplyrs 0}|#{sqrplyrs 0}|#{sqrplyrs 0}|#{sqrplyrs 0}|#{sqrplyrs 0}|#{sqrplyrs 0}|
|________________________________________________________________________________________________________________________|
      BOARD
    end

    def sqrname(square)
      pad_string squares[square].name
    end

    def sqrplyrs(square)
      pad_string "1 2"
    end

    def pad_string(string, width = 10)
      string = string.dup
      if (0..9).include?(string.length)
        (width - string.length).times { string << ' ' }
      end
      string
    end
  end
end
