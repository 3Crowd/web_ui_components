require 'spec_helper'

describe WebUIComponents::Core::BuildingBlocks::Header do

  it "exists" do
    WebUIComponents::Core::BuildingBlocks::Header.should_not be_nil
  end
  
  it "is a class" do
    WebUIComponents::Core::BuildingBlocks::Header.should be_a_kind_of(Class)
  end
  
  context 'building_block_names' do
    
    it 'includes name: header' do
      WebUIComponents::Core::BuildingBlocks::Header.building_block_names.should include(:header)
    end

  end

end
