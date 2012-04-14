module FarmGame
  class Board
    attr_reader :game, :squares

    def initialize(game = nil)
      @game = game
    end

    def squares
      game.squares
    end

    def print(output)
      `clear`
      output.puts <<-BOARD
|------------------------------------------------------------------------------------------------------------------------|
|  Market  |#{sqrname 11}|#{sqrname 12}|#{sqrname 13}|#{sqrname 14}|  Market  |#{sqrname 16}|#{sqrname 17}|#{sqrname 18}|#{sqrname 19}|  Market  |
|#{sqrname 10}|          |          |          |          |#{sqrname 15}|          |          |          |          |#{sqrname 20}|
|#{sqrplyrs 10}|#{sqrplyrs 11}|#{sqrplyrs 12}|#{sqrplyrs 13}|#{sqrplyrs 14}|#{sqrplyrs 15}|#{sqrplyrs 16}|#{sqrplyrs 17}|#{sqrplyrs 18}|#{sqrplyrs 19}|#{sqrplyrs 20}|
|..........|__________________________________________________________________________________________________|..........|
|#{sqrname 9}|                                                                                                  |#{sqrname 21}|
|          |                                                                                                  |          |
|#{sqrplyrs 9}|                                                                                                  |#{sqrplyrs 21}|
|..........|                                                                                                  |..........|
|#{sqrname 8}|                                                                                                  |#{sqrname 22}|
|          |                                                                                                  |          |
|#{sqrplyrs 8}|                                                                                                  |#{sqrplyrs 22}|
|..........|                                                                                                  |..........|
|#{sqrname 7}|                                            Welcome to                                            |#{sqrname 23}|
|          |                                            Farm  Game                                            |          |
|#{sqrplyrs 7}|                                              v#{FarmGame::VERSION}                                              |#{sqrplyrs 23}|
|..........|                                                                                                  |..........|
|#{sqrname 6}|                                                                                                  |#{sqrname 24}|
|          |                                                                                                  |          |
|#{sqrplyrs 6}|                                                                                                  |#{sqrplyrs 24}|
|..........|                                                                                                  |..........|
|  Market  |                                                                                                  |  Market  |
|#{sqrname 5}|                                                                                                  |#{sqrname 25}|
|#{sqrplyrs 5}|                                                                                                  |#{sqrplyrs 25}|
|..........|                                                                                                  |..........|
|#{sqrname 4}|                                                                                                  |#{sqrname 26}|
|          |                                                                                                  |          |
|#{sqrplyrs 4}|                                                                                                  |#{sqrplyrs 26}|
|..........|                                                                                                  |..........|
|#{sqrname 3}|                                                                                                  |#{sqrname 27}|
|          |                                                                                                  |          |
|#{sqrplyrs 4}|                                                                                                  |#{sqrplyrs 27}|
|..........|                                                                                                  |..........|
|#{sqrname 2}|                                                                                                  |#{sqrname 28}|
|          |                                                                                                  |          |
|#{sqrplyrs 2}|                                                                                                  |#{sqrplyrs 28}|
|..........|                                                                                                  |..........|
|#{sqrname 1}|                                                                                                  |#{sqrname 29}|
|          |                                                                                                  |          |
|#{sqrplyrs 1}|                                                                                                  |#{sqrplyrs 29}|
|..........|--------------------------------------------------------------------------------------------------|..........|
|#{sqrname 0}|#{sqrname 39}|#{sqrname 38}|#{sqrname 37}|#{sqrname 36}|  Market  |#{sqrname 34}|#{sqrname 33}|#{sqrname 32}|#{sqrname 31}|  Market  |
|          |          |          |          |          |#{sqrname 35}|          |          |          |          |#{sqrname 30}|
|#{sqrplyrs 0}|#{sqrplyrs 39}|#{sqrplyrs 38}|#{sqrplyrs 37}|#{sqrplyrs 36}|#{sqrplyrs 35}|#{sqrplyrs 34}|#{sqrplyrs 33}|#{sqrplyrs 32}|#{sqrplyrs 31}|#{sqrplyrs 30}|
|________________________________________________________________________________________________________________________|
      BOARD
    end

    def sqrname(square)
      pad_string squares[square].name
    end

    def sqrplyrs(square)
      pad_string game.players_for_square(squares[square]).map(&:name).join(' ')
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
