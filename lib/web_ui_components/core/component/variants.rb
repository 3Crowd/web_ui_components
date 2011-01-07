require 'active_support/concern'

module WebUIComponents
  module Core
    class Component
      # Provides variant functionality. Allows components to provide different styling
      # aspects while maintaining presentation, semantic, and structural separation.
      module Variants
        extend ActiveSupport::Concern
        
        # Instance methods defined here will be added to the extending class's singleton class.
        module ClassMethods
          
         # Define a variant style for this node, only one variant may be active inside
         # an instant and variants must be registered using this method before they
         # are activated
         def variant style_name
           raise NotImplementedError
         end
         
        end
        
      end
    end
  end
end