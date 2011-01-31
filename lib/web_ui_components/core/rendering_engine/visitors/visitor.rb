module WebUIComponents
  module Core
    module RenderingEngine
      module Visitors
        # A base class which defines the visitor interface. All visitors inherit
        # from this class. This class also has constants which provide helpful
        # human readable name references for concrete implementations of visitor
        # classes
        class Visitor
          
          # Accept an object for visitation
          def accept object
            visit object
          end
          
          private
          
          # @private
          DISPATCH = Hash.new do |hash, klass|
            hash[klass] = "visit_#{(klass.name || '').gsub('::','_')}"
          end
          
          # Actually perform visitation
          # @private
          def visit object
            send DISPATCH[object.class], object
          end
          
        end
      end
    end
  end
end

