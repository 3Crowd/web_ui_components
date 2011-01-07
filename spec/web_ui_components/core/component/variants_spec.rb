require 'spec_helper'

describe WebUIComponents::Core::Component::Variants do

  it "exists" do
    WebUIComponents::Core::Component::Variants.should_not be_nil
  end

  it "is a module" do
    WebUIComponents::Core::Component::Variants.should be_a_kind_of(Module)
  end

  it "should be extended with ActiveSupport::Concern" do
    WebUIComponents::Core::Component::Variants.singleton_class.included_modules.should include(ActiveSupport::Concern)
  end

  describe 'class methods' do

    it "exists" do
      WebUIComponents::Core::Component::Variants::ClassMethods.should_not be_nil
    end

    it "is a module" do
      WebUIComponents::Core::Component::Variants::ClassMethods.should be_a_kind_of(Module)
    end

    describe "method variant" do

      it "is defined" do
        WebUIComponents::Core::Component::Variants::ClassMethods.instance_methods.should include(:variant)
      end

      it "adds variant options to the component" do
        pending 'implementation'
      end

    end
  end

end