require 'spec_helper'

describe WebUIComponents::Core do

  it "exists" do
    WebUIComponents::Core.should_not be_nil
  end

  it "is a module" do
    WebUIComponents::Core.should be_a_kind_of(Module)
  end

end