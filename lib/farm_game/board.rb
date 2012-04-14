module FarmGame
  class Board
    attr_reader :squares

    def initialize
      @squares = []
      40.times { @squares << Square.new }
    end
  end
end
