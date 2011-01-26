require 'spec_helper'

describe WebUIComponents::Core::BuildingBlocks::Link do

  it "exists" do
    WebUIComponents::Core::BuildingBlocks::Link.should_not be_nil
  end
  
  it "is a class" do
    WebUIComponents::Core::BuildingBlocks::Link.should be_a_kind_of(Class)
  end
  
  context 'building_block_names' do
    
    it 'includes name: link' do
      WebUIComponents::Core::BuildingBlocks::Link.building_block_names.should include(:link)
    end

  end

end
