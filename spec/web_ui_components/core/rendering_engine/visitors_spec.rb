require 'spec_helper'

describe WebUIComponents::Core::RenderingEngine::Visitors do
  
  before do
    @visitor_module = WebUIComponents::Core::RenderingEngine::Visitors
  end
  
  it 'should exist' do
    @visitor_module.should_not be_nil
  end
  
  context 'module methods' do
    
    describe 'method visitor_for' do
      
      it 'exists' do
        @visitor_module.should respond_to(:visitor_for)
      end
      
    end
    
    describe 'method for' do
      
      it 'exists' do
        @visitor_module.should respond_to(:for)
      end
      
      it 'is aliased to visitor_for' do
        @visitor_module.method(:for).should eql(@visitor_module.method(:visitor_for))
      end
      
    end
    
  end
end
