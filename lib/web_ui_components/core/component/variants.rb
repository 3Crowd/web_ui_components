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
         def variant style_name, &procedure_to_follow_when_activated
           variants[style_name] = procedure_to_follow_when_activated
         end

         # Has this component had the specified variant defined
         def has_variant? style_name
           variants.has_key? style_name
         end

         # Has this component had variants defined
         def has_variants?
           !variants.empty?
         end

         private

         # Returns the variant store, if no store is exists, initialize it
         # @private
         def variants
           @variants ||= Hash.new
         end

        end

      end
    end
  end
end