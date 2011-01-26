module WebUIComponents
  module Core
    module BuildingBlocks
      # The class from which all BuildingBlocks are descended
      # @private
      class BuildingBlock
        
        class << self
          
          # Adds a given name or names to the list of names by which this building_block
          # may be referred to within the component building_blocks method
          def component_name *names_to_add
            names_to_add.each do |name_to_add|
              component_names << name_to_add unless component_names.member?(name_to_add)
            end
          end
          
          # Returns an array of the component names assigned to this building block for use
          # within the component building_blocks method
          def component_names
            @component_names ||= []
          end
          
        end
        
      end
    end
  end
end
