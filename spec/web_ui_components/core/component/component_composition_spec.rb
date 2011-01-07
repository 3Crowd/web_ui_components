require 'spec_helper'

describe WebUIComponents::Core::Component::ComponentComposition do

  it "exists" do
    WebUIComponents::Core::Component::ComponentComposition::ClassMethods.should_not be_nil
  end
  
  it "is a module" do
    WebUIComponents::Core::Component::ComponentComposition::ClassMethods.should be_a_kind_of(Module)
  end
  
  it "should be extended with ActiveSupport::Concern" do
    WebUIComponents::Core::Component::ComponentComposition.singleton_class.included_modules.should include(ActiveSupport::Concern)
  end
  
  describe 'class methods' do
    
    it "exists" do
      WebUIComponents::Core::Component::ComponentComposition::ClassMethods.should_not be_nil
    end
    
    it "is a module" do
      WebUIComponents::Core::Component::ComponentComposition::ClassMethods.should be_a_kind_of(Module)
    end
    
    describe "method composed_of" do
      
      it "is defined" do
        WebUIComponents::Core::Component::ComponentComposition::ClassMethods.instance_methods.should include(:composed_of)
      end
      
      it "adds child components to the component" do
        pending 'implementation'
      end
      
    end
    
  end
    
end