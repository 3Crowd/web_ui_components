require 'spec_helper'

describe WebUIComponents::Core::RenderingEngine::Visitors::ComponentVisitor do
  
  before do
    @component_visitor_class = WebUIComponents::Core::RenderingEngine::Visitors::ComponentVisitor
  end
  
  it 'exists' do
    @component_visitor_class.should_not be_nil
  end
  
  it 'inherits from WebUIComponents::Core::RenderingEngine::Visitors::Visitor' do
    @component_visitor_class.ancestors.should include(WebUIComponents::Core::RenderingEngine::Visitors::Visitor)
  end
  
  describe 'instance methods' do
    
    before do
      @component_visitor_vanilla_instance = @component_visitor_class.new
    end
    
    describe 'method visit_WebUIComponents_Core_Component' do
      
      it 'exists' do
        @component_visitor_vanilla_instance.private_methods.should include(:visit_WebUIComponents_Core_Component)
      end
      
      it 'visits child components' do
        component_class = dynamic_subclass(WebUIComponents::Core::Component, :class_suffix=>'Component')
        component_class.class_eval do
          composed_of :component_sets
        end
        pending 'TODO: need a way to access composed_of components'
      end
      
    end
    
  end
  
end
