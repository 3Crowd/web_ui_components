require 'spec_helper'

describe WebUIComponents::Core::Component do

  it "exists" do
    WebUIComponents::Core::Component.should_not be_nil
  end

  it "is a class" do
    WebUIComponents::Core::Component.should be_a_kind_of(Class)
  end
  
  describe "building block functionality" do
    
    it "includes the BuildingBlocks module which contains the building block functionality implementation" do
      WebUIComponents::Core::Component.included_modules.should include(WebUIComponents::Core::Component::BuildingBlocks)
    end
    
  end
  
  describe "composition of components" do
    
    it "includes the ComponentComposition module which contains the composition of components implementation" do
      WebUIComponents::Core::Component.included_modules.should include(WebUIComponents::Core::Component::ComponentComposition)
    end
    
  end
  
  describe "variant functionality" do
    
    it "includes the Variants module which contains the functionality for implementing variant aspects of components" do
      WebUIComponents::Core::Component.included_modules.should include(WebUIComponents::Core::Component::Variants)
    end
    
  end

end
