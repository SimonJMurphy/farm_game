require 'farm_game/mass_assignment'

module FarmGame
  class Square
    attr_accessor :name

    include MassAssignment
  end
end
