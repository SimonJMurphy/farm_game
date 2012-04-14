require 'spec_helper'

module FarmGame
  describe Board do
    let(:game) { Game.new }

    subject { Board.new game }

    its(:squares) { should be game.squares }

    describe "#sqrname" do
      context "for square 0" do
        it { subject.sqrname(0).should == "  Start   " }
      end
    end

    describe "#pad_string" do
      context "with a string less than the fixed width" do
        context "with an even amount of required padding" do
          let(:string) { " Foobar " }

          it "should centrally pad the string to the fixed width" do
            subject.pad_string(string).should == "  Foobar  "
          end
        end

        context "with an odd amount of required padding" do
          let(:string) { " Foo " }

          it "should centrally pad the string to the fixed width, weighted to the left" do
            subject.pad_string(string).should == "   Foo    "
          end
        end
      end

      context "with a string of the fixed width" do
        let(:string) { " Foo Bar  " }

        it "should pad the string to the fixed width" do
          subject.pad_string(string).should == string
        end
      end
    end
  end
end
