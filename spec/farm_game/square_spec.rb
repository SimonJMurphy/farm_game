require 'spec_helper'

module FarmGame
  describe Square do
    let(:name) { "Foo" }

    subject { Square.new :name => name }

    its(:name) { should be == name }
  end
end
