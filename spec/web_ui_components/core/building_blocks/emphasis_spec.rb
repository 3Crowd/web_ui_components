require 'spec_helper'

describe WebUIComponents::Core::BuildingBlocks::Emphasis do

  it "exists" do
    WebUIComponents::Core::BuildingBlocks::Emphasis.should_not be_nil
  end
  
  it "is a class" do
    WebUIComponents::Core::BuildingBlocks::Emphasis.should be_a_kind_of(Class)
  end
  
  context 'building_block_names' do
    
    it 'includes name: emphasis' do
      WebUIComponents::Core::BuildingBlocks::Emphasis.building_block_names.should include(:emphasis)
    end

  end

end
