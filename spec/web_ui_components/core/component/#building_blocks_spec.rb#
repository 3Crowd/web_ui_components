require 'spec_helper'

describe WebUIComponents::Core::Component::BuildingBlocks do

  describe 'class methods' do

    it "exists" do
      WebUIComponents::Core::Component::BuildingBlocks::ClassMethods.should_not be_nil
    end

    it "is a module" do
      WebUIComponents::Core::Component::BuildingBlocks::ClassMethods.should be_a_kind_of(Module)
    end

    it "should be extended with ActiveSupport::Concern" do
      WebUIComponents::Core::Component::BuildingBlocks.singleton_class.included_modules.should include(ActiveSupport::Concern)
    end

    describe "class methods" do

      describe "method has_building_blocks?" do

        it "is defined" do
          WebUIComponents::Core::Component::BuildingBlocks::ClassMethods.instance_methods.should include(:has_building_blocks?)
        end

        it "indicates whether or not building blocks have been specified for the component" do
          pending 'implementation'
        end

      end

      describe "method building_blocks" do

        it "is defined" do
          WebUIComponents::Core::Component::BuildingBlocks::ClassMethods.instance_methods.should include(:building_blocks)
        end

        it "adds building blocks to the content for the component" do
          pending 'implementation'
        end

      end

    end

  end

end