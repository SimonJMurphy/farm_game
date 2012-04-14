module FarmGame
  class Square
    attr_accessor :name

    def initialize(options = {})
      options.each_pair do |key, value|
        self.send :"#{key}=", value
      end
    end
  end
end
