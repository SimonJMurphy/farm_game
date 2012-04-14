%w{
  version
  board
  die
  game
  player
  player_collection
  square
}.each { |f| require "farm_game/#{f}" }

module FarmGame
  # Your code goes here...
end
