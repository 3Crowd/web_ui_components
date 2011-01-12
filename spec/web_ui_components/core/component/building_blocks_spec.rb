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

        before do
          @component = dynamic_subclass(WebUIComponents::Core::Component, :class_suffix => 'Component')
        end

        it "is defined" do
          @component.should respond_to(:has_building_blocks?)
        end

        context "with no arguments" do

          it "returns true if default building blocks have been specified for the component" do
            @component.class_eval do
              building_blocks do
              end
            end
            @component.should have_building_blocks
          end

          it "returns false if default building blocks have not be specified for the component" do
            @component.should_not have_building_blocks
          end

        end

      end

      describe "method has_building_block_set?" do

        before do
          @component = dynamic_subclass(WebUIComponents::Core::Component, :class_suffix => 'Component')
        end

        it "is defined" do
          @component.should respond_to(:has_building_block_set?)
        end

        context "with no arguments" do

          it "returns true if the default building block set is defined" do
            @component.class_eval do
              building_blocks{}
            end
            @component.should have_building_block_set(:default)
          end

          it "returns false if the default building block set is not defined" do
            @component.should_not have_building_block_set(:default)
          end

        end

        context "with one argument specifying the set name" do

          it "returns true if the specified building block set is defined" do
            @component.class_eval do
              building_blocks :test_block_set do
              end
            end
            @component.should have_building_block_set(:test_block_set)
          end

          it "returns false if the specified building block set is not defined" do
            @component.should_not have_building_block_set(:test_block_set)
          end

        end

      end

      describe "method building_blocks" do

        before do
          @component = dynamic_subclass(WebUIComponents::Core::Component, :class_suffix => 'Component')
        end

        it "is defined" do
          WebUIComponents::Core::Component::BuildingBlocks::ClassMethods.instance_methods.should include(:building_blocks)
        end

        it "should not contain any building block sets if none are specified" do
          @component.should_not have_building_blocks
        end

        context "with no arguments, and passed a block" do

          it "adds building blocks to the content for the component using the :default building_block set name" do
            @component.class_eval do
              building_blocks{}
            end
            @component.should have_building_block_set(:default)
          end
        end


      end

    end

  end

end