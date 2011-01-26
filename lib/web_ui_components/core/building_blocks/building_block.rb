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
            building_block_names << name_to_add unless building_block_names.member?(name_to_add)
          end
          
          # Returns an array of the component names assigned to this building block for use
          # within the component building_blocks method
          def building_block_names
            @building_block_names ||= []
          end
          
        end
        
      end
    end
  end
end
