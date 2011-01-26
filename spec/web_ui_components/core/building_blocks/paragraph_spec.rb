require 'spec_helper'

describe WebUIComponents::Core::BuildingBlocks::Paragraph do

  it "exists" do
    WebUIComponents::Core::BuildingBlocks::Paragraph.should_not be_nil
  end
  
  it "is a class" do
    WebUIComponents::Core::BuildingBlocks::Paragraph.should be_a_kind_of(Class)
  end
  
  context 'building_block_names' do
    
    it 'includes name: paragraph' do
      WebUIComponents::Core::BuildingBlocks::Paragraph.building_block_names.should include(:paragraph)
    end

  end

end
