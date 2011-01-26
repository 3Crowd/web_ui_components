require 'spec_helper'

describe WebUIComponents::Core::BuildingBlocks::Group do

  it "exists" do
    WebUIComponents::Core::BuildingBlocks::Group.should_not be_nil
  end
  
  it "is a class" do
    WebUIComponents::Core::BuildingBlocks::Group.should be_a_kind_of(Class)
  end
  
  context 'building_block_names' do
    
    it 'includes name: group' do
      WebUIComponents::Core::BuildingBlocks::Group.building_block_names.should include(:group)
    end

  end

end
