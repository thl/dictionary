ActionController::Routing::Routes.draw do |map|
  map.resources(:categories, :member => {:expand => :get, :contract => :get}) { |category| category.resources(:children, :controller => 'categories', :member => {:expand => :get, :contract => :get}) }
  #map.definition_edit 'definition_edit', :controller => 'definitions', :action => 'definition_edit'
  #map.resources :definitions, :member => {:definition_edit => :get}
  map.definition_edit 'definitions/:id/definition_edit', :controller => 'definitions', :action => 'definition_edit'
  map.analytical_note_edit 'definitions/:id/analytical_note_edit', :controller => 'definitions', :action => 'analytical_note_edit'
  map.image_description_edit 'definitions/:id/image_description_edit', :controller => 'definitions', :action => 'image_description_edit'
  map.audio_description_edit 'definitions/:id/audio_description_edit', :controller => 'definitions', :action => 'audio_description_edit'
  map.video_description_edit 'definitions/:id/video_description_edit', :controller => 'definitions', :action => 'video_description_edit'
  map.etymology_edit 'etymologies/:id/etymology_edit', :controller => 'etymologies', :action => 'etymology_edit'
  map.etymology_analytical_note_edit 'etymologies/:id/analytical_note_edit', :controller => 'etymologies', :action => 'analytical_note_edit'
  map.etymology_image_description_edit 'etymologies/:id/image_description_edit', :controller => 'etymologies', :action => 'image_description_edit'
  map.etymology_audio_description_edit 'etymologies/:id/audio_description_edit', :controller => 'etymologies', :action => 'audio_description_edit'
  map.etymology_video_description_edit 'etymologies/:id/video_description_edit', :controller => 'etymologies', :action => 'video_description_edit'
  map.pronunciation_analytical_note_edit 'pronunciations/:id/analytical_note_edit', :controller => 'pronunciations', :action => 'analytical_note_edit'
  map.pronunciation_image_description_edit 'pronunciations/:id/image_description_edit', :controller => 'pronunciations', :action => 'image_description_edit'
  map.pronunciation_audio_description_edit 'pronunciations/:id/audio_description_edit', :controller => 'pronunciations', :action => 'audio_description_edit'
  map.pronunciation_video_description_edit 'pronunciations/:id/video_description_edit', :controller => 'pronunciations', :action => 'video_description_edit'
  map.literary_quotation_analytical_note_edit 'literary_quotations/:id/analytical_note_edit', :controller => 'literary_quotations', :action => 'analytical_note_edit'
  map.literary_quotation_image_description_edit 'literary_quotations/:id/image_description_edit', :controller => 'literary_quotations', :action => 'image_description_edit'
  map.literary_quotation_audio_description_edit 'literary_quotations/:id/audio_description_edit', :controller => 'literary_quotations', :action => 'audio_description_edit'
  map.literary_quotation_video_description_edit 'literary_quotations/:id/video_description_edit', :controller => 'literary_quotations', :action => 'video_description_edit'
 
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"
  map.connect 'internal_definitions/:action/:id', :controller => 'definitions'
  
  map.connect '', :controller => "definitions"
  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
