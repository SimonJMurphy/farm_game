require 'spec_helper'

module FarmGame
  describe Board do
    it { should have(40).squares }

    its :squares do
      subject.all? { |s| s.should be_a FarmGame::Square }
    end
  end
end
