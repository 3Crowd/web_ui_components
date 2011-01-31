require 'web_ui_components/core/rendering_engine/visitors/visitor'

module WebUIComponents
  module Core
    module RenderingEngine
      module Visitors
        # Traverses the given building block structure and its children and provides
        # rendering callbacks and state for format rendering functions
        class BuildingBlockVisitor < Visitor
          
          private
          
          # Traverse the WebUIComponents::Core::BuildingBlocks::BuildingBlock or derived structure
          # and its children structures
          # @private
          def visit_WebUIComponents_Core_BuildingBlocks_BuildingBlock o
          end
          
          alias :visit_WebUIComponents_Core_BuildingBlocks_Group :visit_WebUIComponents_Core_BuildingBlocks_BuildingBlock
          alias :visit_WebUIComponents_Core_BuildingBlocks_Header :visit_WebUIComponents_Core_BuildingBlocks_BuildingBlock
          alias :visit_WebUIComponents_Core_BuildingBlocks_Link :visit_WebUIComponents_Core_BuildingBlocks_BuildingBlock
          alias :visit_WebUIComponents_Core_BuildingBlocks_List :visit_WebUIComponents_Core_BuildingBlocks_BuildingBlock
          alias :visit_WebUIComponents_Core_BuildingBlocks_Paragraph :visit_WebUIComponents_Core_BuildingBlocks_BuildingBlock
          alias :visit_WebUIComponents_Core_BuildingBlocks_Text :visit_WebUIComponents_Core_BuildingBlocks_BuildingBlock
        end
      end
    end
  end
end
