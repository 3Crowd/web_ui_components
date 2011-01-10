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
          def building_blocks
            @building_blocks_specified = true
          end

          # Has this component had building blocks defined?
          def has_building_blocks?
            !!@building_blocks_specified
          end

        end

      end
    end
  end
end