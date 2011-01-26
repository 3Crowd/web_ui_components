require 'web_ui_components/core/building_blocks/building_block'
['group', 'header', 'paragraph'].each do |m|
  require 'web_ui_components/core/building_blocks/' + m
end

module WebUIComponents
  module Core
    # This module contains building blocks which define the structure of a document
    # and provide a framing specification for a components content
    module BuildingBlocks
    end
  end
end
