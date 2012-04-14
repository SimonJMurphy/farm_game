module FarmGame
  module MassAssignment
    def initialize(options = {})
      options.each_pair do |key, value|
        self.send :"#{key}=", value
      end
    end
  end
end