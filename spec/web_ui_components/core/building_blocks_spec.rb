require 'spec_helper'

describe WebUIComponents::Core::BuildingBlocks do
  
  it "exists" do
    WebUIComponents::Core::BuildingBlocks.should_not be_nil
  end
  
  it "is a module" do
    WebUIComponents::Core::BuildingBlocks.should be_a_kind_of(Module)
  end
  
end
