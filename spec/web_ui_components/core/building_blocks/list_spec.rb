require 'spec_helper'

describe WebUIComponents::Core::BuildingBlocks::List do

  it "exists" do
    WebUIComponents::Core::BuildingBlocks::List.should_not be_nil
  end
  
  it "is a class" do
    WebUIComponents::Core::BuildingBlocks::List.should be_a_kind_of(Class)
  end
  
  context 'building_block_names' do
    
    it 'includes name: list' do
      WebUIComponents::Core::BuildingBlocks::List.building_block_names.should include(:list)
    end

  end

end
