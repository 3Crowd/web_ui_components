require 'web_ui_components/core/rendering_engine/visitors/visitor'
require 'web_ui_components/core/rendering_engine/visitors/building_block_visitor'
require 'web_ui_components/core/rendering_engine/visitors/component_visitor'

module WebUIComponents
  module Core
    module RenderingEngine
      # A module containing classes implementing the visitor pattern, encapsulating
      # the behavior required for walking various structures and gaining intelligence
      # about the document structure
      module Visitors
        # Stores a mapping of convenient human readable names to visitor class references
        VISITORS = {
          :component => WebUIComponents::Core::RenderingEngine::Visitors::ComponentVisitor,
          :building_block => WebUIComponents::Core::RenderingEngine::Visitors::BuildingBlockVisitor
          }
          
        class << self
          
          # Returns the correct visitor class for the given format
          def visitor_for format
           VISITORS[format]
          end
          
          alias :for :visitor_for
          
        end
          
      end
    end
  end
end
