require 'farm_game/mass_assignment'

module FarmGame
  class Player
    attr_accessor :name, :square

    include MassAssignment
  end
end
