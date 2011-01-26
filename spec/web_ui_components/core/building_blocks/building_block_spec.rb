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
    
    describe 'method building_block_name' do
      
      before do
        @building_block = dynamic_subclass(WebUIComponents::Core::BuildingBlocks::BuildingBlock)
        @building_block_child = dynamic_subclass(@building_block, :class_suffix => 'Child')
        @building_block_sibling = dynamic_subclass(WebUIComponents::Core::BuildingBlocks::BuildingBlock, :class_suffix => 'Sibling')
      end
      
      context 'with a single argument representing a single component_name' do
        
        it 'assigns the block a name for use inside component building block methods' do
          test_building_block_name = :test_building_block
          @building_block.building_block_names.should be_empty
          @building_block.class_eval do
            building_block_name test_building_block_name
          end
          @building_block.building_block_names.should include(test_building_block_name)
        end
        
        context 'does not pollute' do
        
          before do
            @building_block.building_block_names.should be_empty
            @building_block.class_eval do
              building_block_name :test_building_block
            end
            @building_block.building_block_names.should include(:test_building_block)
          end
          
          it 'a sibling class with specified building_block_names' do
            @building_block_sibling.building_block_names.should be_empty
          end
          
          it 'parent class with specified building_block_names' do
            @building_block.superclass.building_block_names.should be_empty
          end
          
          it 'a child class with specified building_block_names' do
            @building_block_child.building_block_names.should be_empty
          end
          
        end
        
      end
      
    end
    
    describe 'method building_block_names' do
      
      before do
        @building_block = dynamic_subclass(WebUIComponents::Core::BuildingBlocks::BuildingBlock)
      end
      
      context 'with no arguments' do
        
        it 'returns an empty array if no names have been registered' do
          @building_block.building_block_names.should be_empty
        end
        
        it 'returns a list of the registered names by which this building_block can be referred to from within a component' do
          test_building_block_names = [:test_component, :test_component_1]
          @building_block.building_block_names.should be_empty
          @building_block.class_eval do
            test_building_block_names.each do |test_building_block_name|
              building_block_name test_building_block_name
            end
          end
          @building_block.building_block_names.should == test_building_block_names
        end 
        
      end
      
    end
    
  end
  
end
