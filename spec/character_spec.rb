require 'spec_helper'

describe Hershey::Character do
  let (:a) {Hershey::Character.new('a', font: :futural)}

  describe "path" do
    it "should be predictable" do
      a.to_path(0).should == "<path stroke=\"black\" fill=\"none\" d=\"M6 -5 L6 9 M6 -2 L4 -4 L2 -5 L-1 -5 L-3 -4 L-5 -2 L-6 1 L-6 3 L-5 6 L-3 8 L-1 9 L2 9 L4 8 L6 6\" transform=\"translate(9,0)\"></path>"
    end
  end
end