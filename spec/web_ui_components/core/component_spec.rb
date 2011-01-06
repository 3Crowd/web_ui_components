require 'spec_helper'

describe WebUIComponents::Core::Component do

  it "exists" do
    WebUIComponents::Core::Component.should_not be_nil
  end

  it "is a class" do
    WebUIComponents::Core::Component.should be_a_kind_of(Class)
  end

end
