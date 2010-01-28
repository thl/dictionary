ActiveResource::Base.send :include, ActiveResource::Acts::Tree

# Include hook code here
require 'patches/active_resource_patch'
require 'models/topical_map_resource'
require 'models/category'
require 'models/translated_title'
require 'helpers/topical_map_categories_helper'
require 'topical_map_builder_integration'
require 'controllers/categories_controller'

ActionView::Base.send :include, TopicalMapCategoriesHelper
ActionController::Base.append_view_path(File.expand_path(File.join(File.dirname(__FILE__), 'lib', 'views')))

require 'dispatcher' unless defined?(::Dispatcher)
::Dispatcher.to_prepare :topical_map_builder_integration do
    # Load these on every request (in dev mode)
    load File.expand_path(File.join(File.dirname(__FILE__), 'lib', 'controllers', 'categories_controller.rb'))    
end