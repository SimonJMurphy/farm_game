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
      print_board
    end

    private

    def print_board
      `clear`
      output.puts <<-BOARD
|------------------------------------------------------------------------------------------------------------------------|
|  Market  | Poultry  | <=2 Ewes | Supplies | Nursery  |  Market  |   Ram    | Pot luck |Vegetables|  1 Cow   |  Market  |
|  Crops   |          |          |          |          |Vegetables|          |          |          |          |  Fruit   |
|          |          |          |          |          |          |          |          |          |          |          |
|..........|__________________________________________________________________________________________________|..........|
| <=3 Cows |                                                                                                  | Poultry  |
|          |                                                                                                  |          |
|          |                                                                                                  |          |
|..........|                                                                                                  |..........|
|  Crops   |                                                                                                  |  Crops   |
|          |                                                                                                  |          |
|          |                                                                                                  |          |
|..........|                                                                                                  |..........|
| Breeding |                                            Welcome to                                            | Supplies |
|          |                                            Farm  Game                                            |          |
|          |                                              v#{FarmGame::VERSION}                                              |          |
|..........|                                                                                                  |..........|
|<=6 Goats |                                                                                                  |Fruit Tree|
|          |                                                                                                  |          |
|          |                                                                                                  |          |
|..........|                                                                                                  |..........|
|  Market  |                                                                                                  |  Market  |
|Livestock |                                                                                                  |Livestock |
|          |                                                                                                  |          |
|..........|                                                                                                  |..........|
|Fruit Tree|                                                                                                  | <=4 Ewes |
|          |                                                                                                  |          |
|          |                                                                                                  |          |
|..........|                                                                                                  |..........|
| Supplies |                                                                                                  | Breeding |
|          |                                                                                                  |          |
|          |                                                                                                  |          |
|..........|                                                                                                  |..........|
|Vegetables|                                                                                                  |Vegetables|
|          |                                                                                                  |          |
|          |                                                                                                  |          |
|..........|                                                                                                  |..........|
| Poultry  |                                                                                                  | <=2 Cows |
|          |                                                                                                  |          |
|   2      |                                                                                                  |          |
|..........|--------------------------------------------------------------------------------------------------|..........|
|  Start   |   Bull   |  Crops   | Pot luck |Billy Goat|  Market  |  Forest  | Supplies |<=2 Goats | Poultry  |  Market  |
|          |          |          |          |          |Vegetables|          |          |          |          |  Crops   |
| 1        |     3 4  |          |          |          |          |          |          |          |          |          |
|________________________________________________________________________________________________________________________|
      BOARD
    end

    attr_reader :output
  end
end
