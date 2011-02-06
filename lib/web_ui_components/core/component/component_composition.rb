require 'active_support/concern'

module WebUIComponents
  module Core
    class Component
      # Provides component composition functionality. Allows component content
      # to be composed of the content of other components.
      module ComponentComposition
        extend ActiveSupport::Concern
        
        # Instance methods defined here will be added to the extending class's singleton class.
        module ClassMethods
          
          # Component tags of which this component is composed
          def composed_of_component_tags
            component_registry
          end
          
          # Specify the other components of which this module is composed
          def composed_of *component_tags_to_define
            component_tags_to_define.each do |component_tag_to_define|
              unless composed_of?(component_tag_to_define)
                component_registry << component_tag_to_define 
                define_instance_composed_of_component_collection_getter_method component_tag_to_define
                define_instance_composed_of_component_collection_setter_method component_tag_to_define
              end
            end
          end

          # Query if a component is defined
          # @param [ Symbol ] component_tag Component tag with which to query the list of defined components
          def composed_of? component_tag
            component_registry.include?(component_tag)
          end

          private

          # A hash of the current components in this component
          # @private
          def component_registry
            @components ||= []
          end
          
          # Dynamically defines a component collection getter method
          # @private
          def define_instance_composed_of_component_collection_getter_method composed_of_component_name
            define_method composed_of_component_name do
              composed_of_component_collection[composed_of_component_name] || []
            end
          end
          
          # Dynamically defines a component collection setter method
          # @private
          def define_instance_composed_of_component_collection_setter_method composed_of_component_name
            define_method composed_of_component_name.to_s+'=' do |value_to_set|
              composed_of_component_collection[composed_of_component_name] = value_to_set
            end
          end

        end
        
        # Instance methods defined here will be added to the class
        module InstanceMethods
          
          private
          
          # Store for composed_of component collections
          # @private
          def composed_of_component_collection
            @composed_of_components ||= Hash.new
          end
          
        end
      end
    end
  end
end