require 'rspec'
require 'rspec/autorun'

RSpec.configure do |config|
end

require 'web_ui_components'

# Creates a subclass of the given class with no name, i.e.
# not assigned to a constant
def dynamic_anonymous_subclass class_to_subclass
  Class.new(class_to_subclass)
end

# Creates a class, which is a subclass of the given class
def dynamic_subclass class_to_subclass = Object, opts = {}
  opts = { 
    :class_location => self.class,
    :class_prefix => "",
    :class_suffix => "",
    :class_identifier => "DynamicClass",
    :class_unique_id => self.object_id,
    :includes => []
    }.merge(opts)
  class_name = opts[:class_name] ? opts[:class_name] : "#{opts[:class_prefix]}#{opts[:class_identifier]}#{opts[:class_unique_id]}#{opts[:class_suffix]}"
  class_constant = opts[:class_location].const_set(class_name, dynamic_anonymous_subclass(class_to_subclass))
  class_constant.class_eval do
    opts[:includes].each do |module_to_include|
      include module_to_include
    end
  end
  class_constant
end
