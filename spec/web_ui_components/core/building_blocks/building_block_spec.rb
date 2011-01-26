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
    
    describe 'method component_name' do
      
      before do
        @building_block = dynamic_subclass(WebUIComponents::Core::BuildingBlocks::BuildingBlock)
      end
      
      context 'with a single argument representing a single component_name' do
        
        it 'assigns the block a name for use inside component building block methods' do
          test_building_block_name = :test_building_block
          @building_block.component_names.should be_empty
          @building_block.class_eval do
            component_name test_building_block_name
          end
          @building_block.component_names.should include(test_building_block_name)
        end
        
      end
      
      context 'with multiple arguments representing a collection of component_names' do
        
        it 'assigns the block multiple names for use inside component building block methods' do
          test_building_block_names = [ :test_building_block, :test_building_block_1, :test_building_block_2 ]
          @building_block.component_names.should be_empty
          @building_block.class_eval do
            component_name *test_building_block_names
          end
          test_building_block_names.each do |building_block_name|
            @building_block.component_names.should include(building_block_name)
          end
        end
        
      end
      
    end
    
    describe 'method component_names' do
      
      before do
        @building_block = dynamic_subclass(WebUIComponents::Core::BuildingBlocks::BuildingBlock)
      end
      
      context 'with no arguments' do
        
        it 'returns a list of the registered names by which this building_block can be referred to from within a component' do
          test_component_names = [:test_component, :test_component_1]
          @building_block.component_names.should be_empty
          @building_block.class_eval do
            component_name *test_component_names
          end
          @building_block.component_names.should == test_component_names
        end
        
      end
      
    end
    
  end
  
end
