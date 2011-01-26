require 'active_support/concern'

module WebUIComponents
  module Core
    class Component
      # Provides building block functionality to allow components to specify how
      # their content should be rendered, and what rendering that content will require
      # on the target system
      module BuildingBlocks
        extend ActiveSupport::Concern

        # Instance methods defined here will be added to the extending class's singleton class.
        module ClassMethods

          # Specify the building blocks that make up the content of this component
          def building_blocks set_name = :default, &building_block_set
            building_blocks_store[set_name] = building_block_set
          end

          # Has this component had building blocks defined?
          def has_building_blocks?
            !building_blocks_store.empty?
          end

          # Has this component had a specified named building block set defined?
          def has_building_block_set? set_name = :default
            !building_blocks_store[set_name].nil?
          end
          
          # Registers a givne building block with the given name
          def register_building_block building_block, name
            registered_building_blocks[name] = building_block
          end
          
          # Tests for the presence of a building block registered with the given name
          def has_building_block_name_registered? name
            registered_building_blocks.has_key?(name)
          end
          
          # Tests for the presense of a building block class that has been registered under
          # any name
          def has_building_block_registered? building_block_class
            registered_building_blocks.has_value?(building_block_class)
          end
          
          def has_building_block_name_registered_to_building_block? building_block_name, building_block_class
            registered_building_blocks.has_key?(building_block_name) && (registered_building_blocks[building_block_name] == building_block_class)
          end

          private

          # provides an accessor and allows to lazily initialize the building blocks stored in the component
          # @private
          def building_blocks_store
            @building_bocks ||= Hash.new
          end
          
          # provides an accessor and allows lazy initiation of the building blocks registered with the component
          # @private
          def registered_building_blocks
            @registered_building_blocks ||= Hash.new
          end

        end

      end
    end
  end
end