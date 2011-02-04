require 'spec_helper'

describe WebUIComponents::Core::RenderingEngine::Visitors::BuildingBlockVisitor do
  
  before do
    @building_block_visitor_class = WebUIComponents::Core::RenderingEngine::Visitors::BuildingBlockVisitor
  end
  
  it 'exists' do
    @building_block_visitor_class.should_not be_nil
  end
  
  it 'inherits from WebUIComponents::Core::RenderingEngine::Visitors::Visitor' do
    @building_block_visitor_class.ancestors.should include(WebUIComponents::Core::RenderingEngine::Visitors::Visitor)
  end
  
  describe 'instance methods' do
    
    before do
      @building_block_visitor_instance = @building_block_visitor_class.new
    end
    
    describe 'method visit_WebUIComponents_Core_BuildingBlocks_BuildingBlock' do
      
      it 'exists' do
        @building_block_visitor_instance.private_methods.should include(:visit_WebUIComponents_Core_BuildingBlocks_BuildingBlock)
      end
      
      it 'visits child building blocks' do
        pending 'TODO: need a way in which to access child building blocks'
      end
      
    end
    
    describe 'method visit_WebUIComponents_Core_BuildingBlocks_Group' do
      
      it 'is aliased to visit_WebUIComponents_Core_BuildingBlocks_BuildingBlock' do
        @building_block_visitor_instance.method(:visit_WebUIComponents_Core_BuildingBlocks_Group).should eql(@building_block_visitor_instance.method(:visit_WebUIComponents_Core_BuildingBlocks_BuildingBlock))
      end
      
    end
    
    describe 'method visit_WebUIComponents_Core_BuildingBlocks_Header' do
      
      it 'is aliased to visit_WebUIComponents_Core_BuildingBlocks_BuildingBlock' do
        @building_block_visitor_instance.method(:visit_WebUIComponents_Core_BuildingBlocks_Header).should eql(@building_block_visitor_instance.method(:visit_WebUIComponents_Core_BuildingBlocks_BuildingBlock))
      end
      
    end
    
    describe 'method visit_WebUIComponents_Core_BuildingBlocks_Link' do
      
      it 'is aliased to visit_WebUIComponents_Core_BuildingBlocks_BuildingBlock' do
        @building_block_visitor_instance.method(:visit_WebUIComponents_Core_BuildingBlocks_Link).should eql(@building_block_visitor_instance.method(:visit_WebUIComponents_Core_BuildingBlocks_BuildingBlock))
      end
      
    end
    
    describe 'method visit_WebUIComponents_Core_BuildingBlocks_List' do
      
      it 'is aliased to visit_WebUIComponents_Core_BuildingBlocks_BuildingBlock' do
        @building_block_visitor_instance.method(:visit_WebUIComponents_Core_BuildingBlocks_List).should eql(@building_block_visitor_instance.method(:visit_WebUIComponents_Core_BuildingBlocks_BuildingBlock))
      end
      
    end
    
    describe 'method visit_WebUIComponents_Core_BuildingBlocks_Paragraph' do
      
      it 'is aliased to visit_WebUIComponents_Core_BuildingBlocks_BuildingBlock' do
        @building_block_visitor_instance.method(:visit_WebUIComponents_Core_BuildingBlocks_Paragraph).should eql(@building_block_visitor_instance.method(:visit_WebUIComponents_Core_BuildingBlocks_BuildingBlock))
      end
      
    end
    
    describe 'method visit_WebUIComponents_Core_BuildingBlocks_Text' do
      
      it 'is aliased to visit_WebUIComponents_Core_BuildingBlocks_BuildingBlock' do
        @building_block_visitor_instance.method(:visit_WebUIComponents_Core_BuildingBlocks_Text).should eql(@building_block_visitor_instance.method(:visit_WebUIComponents_Core_BuildingBlocks_BuildingBlock))
      end
      
    end
  end
  
end
