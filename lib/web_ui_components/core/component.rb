require 'web_ui_components/core/component/building_blocks'
require 'web_ui_components/core/component/component_composition'
require 'web_ui_components/core/component/variants'

module WebUIComponents
  module Core
    # The ancestor of all components. Defines primary DSL for defining component
    # structure.
    class Component
      
      include BuildingBlocks
      include ComponentComposition
      include Variants
      
    end
  end
end
