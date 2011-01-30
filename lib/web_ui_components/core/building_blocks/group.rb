require 'web_ui_components/core/building_blocks/building_block'

module WebUIComponents
  module Core
    module BuildingBlocks
      # Defines a grouping of building blocks. May be empty.
      class Group < BuildingBlock
        
        building_block_name :group
        
        style :anonymous_inline do |instance|
        end
        
        style :anonymous_block do |instance|
        end
        
      end
    end
  end
end
