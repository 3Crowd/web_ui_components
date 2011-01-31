require 'spec_helper'

describe WebUIComponents::Core::RenderingEngine::Visitors::Visitor do
  
  before do
    @visitor_class = WebUIComponents::Core::RenderingEngine::Visitors::Visitor
  end
  
  it 'exists' do
    @visitor_class.should_not be_nil
  end
  
  context 'dynamic constants' do
    
    describe 'DISPATCH' do
      
      it 'correctly converts the given class index request into the correct dispatch method reference' do
        @visitor_class::DISPATCH[Object].should eql('visit_Object')
      end
      
    end
    
  end
  
  describe 'instance methods' do
    
    before do
      @visitor_class_vanilla_instance = @visitor_class.new
    end
    
    describe 'method accept' do
      
      it 'causes the given object to be visited' do
        @object_to_be_visited = Object.new
        @visitor_class_vanilla_instance.should_receive(:visit).with(@object_to_be_visited).and_return(nil)
        @visitor_class_vanilla_instance.accept(@object_to_be_visited)
      end
      
    end
    
    describe 'method visit' do
      
      context 'with one argument, the object which should be visited' do
        
        it 'sends the dispatch message to itself' do
          @object_to_visit = Object.new
          @visitor_class_vanilla_instance.should_receive(:visit_Object).and_return(nil)
          @visitor_class_vanilla_instance.send(:visit, @object_to_visit)
        end
        
      end
      
    end
    
  end
  
end
