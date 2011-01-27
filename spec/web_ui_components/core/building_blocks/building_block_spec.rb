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
          test_building_block_name = :test_building_block_assignment
          @building_block.building_block_names.should be_empty
          @building_block.class_eval do
            building_block_name test_building_block_name
          end
          @building_block.building_block_names.should include(test_building_block_name)
        end
        
        it 'registers the building block name with the base component' do
          building_block_name_to_test = :test_building_block_registration
          @building_block.class_eval do
            building_block_name building_block_name_to_test
          end
          WebUIComponents::Core::Component.should have_building_block_name_registered(building_block_name_to_test)
          WebUIComponents::Core::Component.should have_building_block_name_registered_to_building_block(building_block_name_to_test, @building_block)
        end
        
        context 'does not pollute' do
          
          it 'a sibling class with specified building_block_names' do
            @building_block.class_eval do
              building_block_name :test_building_block_sibling_pollution
            end
            @building_block_sibling.building_block_names.should be_empty
          end
          
          it 'parent class with specified building_block_names' do
            @building_block.class_eval do
              building_block_name :test_building_block_parent_pollution
            end
            @building_block.superclass.building_block_names.should be_empty
          end
          
          it 'a child class with specified building_block_names' do
            @building_block.class_eval do
              building_block_name :test_building_block_child_pollution
            end
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
          test_building_block_names = [:test_building_block_references, :test_building_block_references_1]
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
    
    describe 'method style' do
      
      before do
        @building_block = dynamic_subclass(WebUIComponents::Core::BuildingBlocks::BuildingBlock)
      end
      
      context 'with a single argument and a block' do
        
        it 'registers the style' do
          pending
        end
        
        it 'associates the style with the given block' do
          pending
        end
        
      end
      
      context 'with a single argument and no block' do
        
        it 'registers the style' do
          pending
        end
        
        it 'associates the style with no block' do
          pending
        end
        
      end
      
    end
    
    describe 'method styles' do
      
      before do
        @building_block = dynamic_subclass(WebUIComponents::Core::BuildingBlocks::BuildingBlock)
      end
      
      context 'with a no argument' do
        
        it 'returns an array of available styles' do
          pending
        end
        
      end
      
    end
    
    describe 'method property' do
    end
    
    describe 'method has_property?' do
    end
    
  end
  
end
