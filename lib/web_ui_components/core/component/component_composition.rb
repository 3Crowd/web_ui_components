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
            components.keys
          end
          
          # Specify the other components of which this module is composed
          def composed_of *component_tags_to_define
            component_tags_to_define.each do |component_tag_to_define|
              components[component_tag_to_define] = nil
            end
          end

          # Query if a component is defined
          # @param [ Symbol ] component_tag Component tag with which to query the list of defined components
          def composed_of? component_tag
            components.has_key?(component_tag)
          end

          private

          # A hash of the current components in this component
          # @private
          def components
            @components ||= Hash.new
          end

        end

      end
    end
  end
end