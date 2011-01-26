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
          @component.should respond_to(:building_blocks)
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
      
      describe "method register_building_block" do
        
        before do
          @component = dynamic_subclass(WebUIComponents::Core::Component, :class_suffix => 'Component')
        end
        
        it 'is defined' do
          @component.should respond_to(:register_building_block)
        end
        
        context 'with two arguments (first the building block, and then second, the name)' do
          
          it 'registers the building block' do
            @component.register_building_block(Object, :test_block)
            @component.should have_building_block_name_registered(:test_block)
          end
          
        end
        
      end
      
      describe "method has_building_block_name_registered?" do
        
        before do
          @component = dynamic_subclass(WebUIComponents::Core::Component, :class_suffix => 'Component')
          @component.register_building_block(Object, :test_object)
        end
        
        it 'is defined' do
          @component.should respond_to(:has_building_block_name_registered?)
        end

        context 'with one argument' do
          
          it 'responds with true if the given building block name is registered' do
            @component.should have_building_block_name_registered(:test_object)
          end
          
          it 'responds with false if the given building block name is not registered' do
            @component.should_not have_building_block_name_registered(:foo_master_block)
          end
          
        end
        
      end
      
      describe "method has_building_block_registered?" do
        
        before do
          @component = dynamic_subclass(WebUIComponents::Core::Component, :class_suffix => 'Component')
          @test_object_class = Object
          @component.register_building_block(@test_object_class, :test_block)
        end
        
        it 'is defined' do
          @component.should respond_to(:has_building_block_registered?)
        end
        
        context 'with one argument' do
          
          it 'returns true if the given class is registered' do
            @component.should have_building_block_registered(@test_object_class)
          end
          
          it 'returns false if the given class is not registered' do
            @component.should_not have_building_block_registered(Class.new)
          end
          
        end
        
      end
      
      describe "method has_building_block_name_registered_to_building_block?" do
        
        before do
          @component = dynamic_subclass(WebUIComponents::Core::Component, :class_suffix => 'Component')
          @test_name = :test_building_block
          @test_object_class = Object
          @test_object_incorrect_class = Hash
        end
        
        context 'with two arguments, one specifying the building block name, the second specifying the building block class' do
          
          it 'returns true if the given building block name refers to the given building block class' do
            @component.register_building_block(@test_object_class, @test_name)
            @component.has_building_block_name_registered_to_building_block?(@test_name, @test_object_class).should be_true
          end
          
          it 'returns false if the given building block name does not refer to the given building block class' do
            @component.register_building_block(@test_object_incorrect_class, @test_name)
            @component.has_building_block_name_registered_to_building_block?(@test_name, @test_object_class).should be_false
          end
          
          it 'returns false if the given building block name does not refer to any building block class' do
            @component.has_building_block_name_registered_to_building_block?(@test_name, @test_object_class).should be_false
          end
          
        end
        
      end

    end

  end

end