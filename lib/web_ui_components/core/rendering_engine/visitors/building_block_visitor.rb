require 'web_ui_components/core/rendering_engine/visitors/visitor'

module WebUIComponents
  module Core
    module RenderingEngine
      module Visitors
        class BuildingBlockVisitor < Visitor
          
          private
          
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
