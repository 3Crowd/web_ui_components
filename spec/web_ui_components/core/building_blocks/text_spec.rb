require 'spec_helper'

describe WebUIComponents::Core::BuildingBlocks::Text do

  it "exists" do
    WebUIComponents::Core::BuildingBlocks::Text.should_not be_nil
  end
  
  it "is a class" do
    WebUIComponents::Core::BuildingBlocks::Text.should be_a_kind_of(Class)
  end
  
  context 'building_block_names' do
    
    it 'includes name: text' do
      WebUIComponents::Core::BuildingBlocks::Text.building_block_names.should include(:text)
    end

  end

end
