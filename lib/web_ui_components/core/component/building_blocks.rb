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

          private

          def building_blocks_store
            @building_bocks ||= Hash.new
          end

        end

      end
    end
  end
end