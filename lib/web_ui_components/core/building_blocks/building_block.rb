require 'web_ui_components/core/component'

module WebUIComponents
  module Core
    module BuildingBlocks
      # The class from which all BuildingBlocks are descended
      # @private
      class BuildingBlock
        
        class << self
          
          # Adds a given name or names to the list of names by which this building_block
          # may be referred to within the component building_blocks method
          def building_block_name name_to_add
            unless building_block_names.member? name_to_add
              building_block_names << name_to_add
              register_building_block_with_base_component name_to_add
            end
          end
          
          # Returns an array of the component names assigned to this building block for use
          # within the component building_blocks method
          def building_block_names
            @building_block_names ||= []
          end
          
          # Registers the given style as available and associates the given procedure with
          # the style. This procedure will be executed when the style is selected
          def style style_name, &procedure
            registered_styles[style_name] = procedure
          end
          
          # Returns a list of registered styles for the building block class
          def styles
            registered_styles.keys
          end
          
          # Returns true if the given style name has a procedure that will be executed when
          # the style is set. Returns false if the style is not registered or if the style
          # does not have an associated procedure.
          def has_associated_procedure_for_style? style_name
            registered_styles.has_key?(style_name) && registered_styles[style_name].kind_of?(Proc)
          end
          
          private
          
          # Registered style storage
          # @private
          def registered_styles
            @registered_styles ||= Hash.new
          end
          
          # Registers this building block with the base component from which
          # all other components are derived
          # @private
          def register_building_block_with_base_component name_to_add
            WebUIComponents::Core::Component.register_building_block(self, name_to_add)
          end
          
        end
        
      end
    end
  end
end
