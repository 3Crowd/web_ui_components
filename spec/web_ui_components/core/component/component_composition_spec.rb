require 'spec_helper'

describe WebUIComponents::Core::Component::ComponentComposition do

  it "exists" do
    WebUIComponents::Core::Component::ComponentComposition.should_not be_nil
  end

  it "is a module" do
    WebUIComponents::Core::Component::ComponentComposition.should be_a_kind_of(Module)
  end

  it "should be extended with ActiveSupport::Concern" do
    WebUIComponents::Core::Component::ComponentComposition.singleton_class.included_modules.should include(ActiveSupport::Concern)
  end
  
  describe 'dynamic instance methods' do
    
    before do
      @composed_of_component_name = composed_of_component_name = :test_component_1
      @component_class = dynamic_subclass(Object, :class_suffix => 'Component', :includes => [WebUIComponents::Core::Component::ComponentComposition])
      @component_class.class_eval do
        composed_of composed_of_component_name
      end
      @component_class_instance = @component_class.new
    end
    
    describe 'dynamic method {composed_of :component_name}' do
      
      it 'exists for a declared composed_of component' do
        @component_class_instance.should respond_to(@composed_of_component_name)
      end
      
      it 'returns an array of components' do
        @component_class_instance.send(@composed_of_component_name).should be_a_kind_of(Array)
      end
      
    end
    
    describe 'dynamic method {composed_of :component_name}=' do
      
      it 'exists for a declared composed_of component' do
        @component_class_instance.should respond_to(@composed_of_component_name.to_s+'=')
      end
      
      it 'alters the collection for a declared composed_of component' do
        collection_to_set = [@component_class_instance]
        @component_class_instance.send(@composed_of_component_name).should_not eql(collection_to_set)
        @component_class_instance.send(@composed_of_component_name.to_s+'=', collection_to_set)
        @component_class_instance.send(@composed_of_component_name).should eql(collection_to_set)
      end
      
    end
    
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
          component = dynamic_subclass(Object, :class_suffix => 'Component', :includes => [WebUIComponents::Core::Component::ComponentComposition])
          component.class_eval do
            composed_of :tabs
          end
          component.composed_of_component_tags.should include(:tabs)
        end

      end

      context "with multiple arguments" do

        it "adds all specified components to the component" do
          component = dynamic_subclass(Object, :class_suffix => 'Component', :includes => [WebUIComponents::Core::Component::ComponentComposition])
          composed_of_components = [:tabs, :heads, :frets, :notes]
          component.class_eval do
            composed_of *composed_of_components
          end
          composed_of_components.each do |composed_of_component|
            component.composed_of_component_tags.should include(composed_of_component)
          end
        end

      end

    end
    
    describe 'method composed_of_component_tags' do
      
      before do
        @component = dynamic_subclass(Object, :class_suffix => 'Component', :includes => [WebUIComponents::Core::Component::ComponentComposition])
        @component_tags = component_tags = [:test_tag_1, :test_tag_2]
        @component.class_eval do
          component_tags.each do |tag|
            composed_of tag
          end
        end
      end
      
      it 'returns an array containing a list of tags referring to components of which the component is composed' do
        @component.composed_of_component_tags.should eql(@component_tags)
      end
      
    end

    describe "method composed_of?" do

      before do
        @component = dynamic_subclass(Object, :class_suffix => 'Component', :includes => [WebUIComponents::Core::Component::ComponentComposition])
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