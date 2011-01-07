require 'active_support/concern'

module WebUIComponents
  module Core
    class Component
      # Provides component composition functionality. Allows component content
      # to be composed of the content of other components.
      module ComponentComposition
        extend ActiveSupport::Concern
        
        # Instance methods defined here will be added to the extending class's singleton class.
        module ClassMethods
          
          # Specify the other components of which this module is composed
          def composed_of *components
            raise NotImplementedError
          end
          
        end
        
      end
    end
  end
end