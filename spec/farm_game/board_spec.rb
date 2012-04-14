require 'spec_helper'

module FarmGame
  describe Board do
    it { should have(40).squares }

    its :squares do
      subject.all? { |s| s.should be_a FarmGame::Square }
    end

    describe "#sqrname" do
      context "for square 0" do
        it { subject.sqrname(0).should == "Start     " }
      end
    end

    describe "#pad_string" do
      context "with a string less than the fixed width" do
        let(:string) { " Foo " }

        it "should pad the string to the fixed width" do
          subject.pad_string(string).should == " Foo      "
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
