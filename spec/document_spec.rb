require 'spec_helper'

describe Hershey::Document do
  it "should produce same output" do
    Hershey.svg("It's all OKAY!", font: :futural, width: 500).should == File.read("spec/ex.svg")
  end
end
