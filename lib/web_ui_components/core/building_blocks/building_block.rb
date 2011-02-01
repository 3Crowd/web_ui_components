require 'web_ui_components/core/component'

module WebUIComponents
  module Core
    module BuildingBlocks
      # The class from which all BuildingBlocks are descended
      # @private
      class BuildingBlock
        
        class << self
          
          # Adds a given name or names to the list of names by which this building_block
          # may be referred to within the component building_blocks method
          def building_block_name name_to_add
            unless building_block_names.member? name_to_add
              building_block_names << name_to_add
              register_building_block_with_base_component name_to_add
            end
          end
          
          # Returns an array of the component names assigned to this building block for use
          # within the component building_blocks method
          def building_block_names
            @building_block_names ||= []
          end
          
          # Registers the given style as available and associates the given procedure with
          # the style. This procedure will be executed when the style is selected
          def style style_name, &procedure
            registered_styles[style_name] = procedure
          end
          
          # Returns a list of registered styles for the building block class
          def styles
            registered_styles.keys
          end
          
          # Returns true if the given style name has a procedure that will be executed when
          # the style is set. Returns false if the style is not registered or if the style
          # does not have an associated procedure.
          def has_associated_procedure_for_style? style_name
            styles.include?(style_name) && associated_procedure_for_style(style_name).respond_to?(:call)
          end
          
          # Returns a reference to the procedure associated to a given style. Returns an empty
          # procedure if the given style is not registered
          def associated_procedure_for_style style_name
            if registered_styles.has_key?(style_name)
              registered_styles[style_name]
            else
              lambda{|building_block_instance|}
            end
          end
          
          # Adds a given property to the list of valid properties for the building block. Options
          # specified in the second argument may be applied. If options[:valid_options] is set then
          # options[:value] must be set or the value will be set to true, even if true is not in the list
          # of valid_options
          def property property_name, options = {}
            registered_properties[property_name] = {
              :default_value => options.has_key?(:default_value) ? options[:default_value] : true,
              :valid_values => options.has_key?(:valid_values) ? options[:valid_values] : [true, false]
            }
            
            define_instance_property_getter_method property_name
            define_instance_property_setter_method property_name
            
          end
          
          # Returns an array of declared property names
          def properties
            registered_properties.keys
          end
          
          # Returns an array of the valid values declared for the given property name
          def valid_values_for_property property_name
            if registered_properties.has_key?(property_name)
              registered_properties[property_name][:valid_values]
            else
              nil
            end
          end
          
          # Returns the default value declared for the given property name.
          def default_value_for_property property_name
            if registered_properties.has_key?(property_name)
              registered_properties[property_name][:default_value]
            else
              nil
            end
          end
          
          private
          
          # Dynamically defines an instance property getter method
          # @private
          def define_instance_property_getter_method property_name
            define_method property_name do
              if @registered_property_values && @registered_property_values.has_key?(property_name)
                @registered_property_values[property_name]
              else
                self.class.default_value_for_property(property_name)
              end
            end
          end
          
          # Dynamically defines an instance property setter method
          # @private
          def define_instance_property_setter_method property_name
            define_method property_name.to_s+'=' do |value_to_set|
              @registered_property_values ||= Hash.new
              @registered_property_values[property_name] = value_to_set
            end
          end
          
          # Registered style storage
          # @private
          def registered_styles
            @registered_styles ||= Hash.new
          end
          
          # Registered property storage
          # @private
          def registered_properties
            @registered_properties ||= Hash.new
          end
          
          # Registers this building block with the base component from which
          # all other components are derived
          # @private
          def register_building_block_with_base_component name_to_add
            WebUIComponents::Core::Component.register_building_block(self, name_to_add)
          end
          
        end
        
        def initialize options={}
          activate_style(options[:style]) if options.has_key?(:style)
        end
        
        private
        
        # Activate a style by calling its associated procedure in the instance's scope
        # @private
        def activate_style style_name
          self.class.associated_procedure_for_style(style_name).call(self)
        end
        
      end
    end
  end
end
