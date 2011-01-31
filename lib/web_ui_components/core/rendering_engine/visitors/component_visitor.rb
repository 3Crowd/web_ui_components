require 'web_ui_components/core/rendering_engine/visitors/visitor'

module WebUIComponents
  module Core
    module RenderingEngine
      module Visitors
        # Traverses the given component structure and its children and provides
        # rendering callbacks and state for format rendering functions
        class ComponentVisitor < Visitor
          
          private
          
          # Traverse the WebUIComponents::Core::Component structure
          # @private
          def visit_WebUIComponents_Core_Component o
          end
          
        end
      end
    end
  end
end
