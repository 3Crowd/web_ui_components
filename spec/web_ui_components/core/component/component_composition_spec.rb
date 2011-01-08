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

      context "with a single argument" do

        it "adds specified component to the component" do
          component = dynamic_subclass(WebUIComponents::Core::Component, :class_suffix => 'Component')
          component.class_eval do
            composed_of :tabs
          end
          component.send(:components).should have_key(:tabs)
        end

      end

      context "with multiple arguments" do

        it "adds all specified components to the component" do
          component = dynamic_subclass(WebUIComponents::Core::Component, :class_suffix => 'Component')
          composed_of_components = [:tabs, :heads, :frets, :notes]
          component.class_eval do
            composed_of *composed_of_components
          end
          composed_of_components.each do |composed_of_component|
            component.send(:components).should have_key(composed_of_component)
          end
        end

      end

    end

    describe "method composed_of?" do

      before do
        @component = dynamic_subclass(WebUIComponents::Core::Component, :class_suffix => 'Component')
        @component.class_eval do
          composed_of :tags
        end
      end

      it "is defined" do
        WebUIComponents::Core::Component::ComponentComposition::ClassMethods.instance_methods.should include(:composed_of?)
      end

      it "returns true if a component is defined as being composed_of the given component" do
        @component.should be_composed_of(:tags)
      end

      it "returns false if a component is not defined as being composed_of the given component" do
        @component.should_not be_composed_of(:gluons)
      end

    end

  end

end