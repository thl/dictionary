require 'patches/rails_generator_patch'
class TopicalMapCategoriesGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.file 'lightbox.js', 'public/javascripts/lightbox.js'
      m.file 'lightbox.css', 'public/stylesheets/lightbox.css'
      m.file 'loadingAnimation2.gif', 'public/images/loadingAnimation2.gif'
      m.route_nested_resources 'map.resources(:categories, :member => {:expand => :get, :contract => :get}) { |category| category.resources(:children, :controller => \'categories\', :member => {:expand => :get, :contract => :get}) }'
    end
  end
end