require 'spec_helper'

describe Hershey do
  it "should create the same output as a normal call" do
    doc = Hershey::Document.new
    doc.write("hi")
    Hershey.svg("hi").should == doc.svg
  end
end
