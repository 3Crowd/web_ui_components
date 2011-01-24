require 'spec_helper'

describe WebUIComponents::Core::BuildingBlocks::BuildingBlock do
  
  it "exists" do
    WebUIComponents::Core::BuildingBlocks::BuildingBlock.should_not be_nil
  end
  
  it "is a class" do
    WebUIComponents::Core::BuildingBlocks::BuildingBlock.should be_a_kind_of(Class)
  end
  
  it 'does not register a building block name with the base component' do
    WebUIComponents::Core::Component.should_not have_building_block_registered(WebUIComponents::Core::BuildingBlocks::BuildingBlock)
  end
  
  describe 'class methods' do
  end
  
end
