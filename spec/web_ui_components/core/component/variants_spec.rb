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

      before do
        @component = dynamic_subclass(WebUIComponents::Core::Component, :class_suffix => 'Component')
        @component.class_eval do
          variant :test
        end
      end

      it "is defined" do
        WebUIComponents::Core::Component::Variants::ClassMethods.instance_methods.should include(:variant)
      end

      it "adds variant options to the component" do
        @component.should have_variant(:test)
      end

    end

    describe "method has_variant?" do

      before do
        @component = dynamic_subclass(WebUIComponents::Core::Component, :class_suffix => 'Component')
      end

      it "is defined" do
        WebUIComponents::Core::Component::Variants::ClassMethods.instance_methods.should include(:has_variant?)
      end

      context "with a single argument" do

        it "returns true when a given style variant is defined" do
          @component.class_eval do
            variant :test
          end
          @component.should have_variant(:test)
        end

        it "returns false when a given style variant is not defined" do
          @component.should_not have_variant(:test)
        end

      end

    end

    describe "method has_variants?" do

      before do
        @component = dynamic_subclass(WebUIComponents::Core::Component, :class_suffix => 'Component')
      end

      it "is defined" do
        WebUIComponents::Core::Component::Variants::ClassMethods.instance_methods.should include(:has_variants?)
      end

      context "with zero arguments" do

        it "returns true when variants are defined" do
          @component.class_eval do
            variant :test
          end
          @component.should have_variants
        end

        it "returns false when variants are defined and has no variants by default" do
          @component.should_not have_variants
        end

      end

    end
  end

end