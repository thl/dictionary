ActionController::Routing::Routes.draw do |map|
  map.resources(:categories, :member => {:expand => :get, :contract => :get}) { |category| category.resources(:children, :controller => 'categories', :member => {:expand => :get, :contract => :get}) }
  #map.definition_edit 'definition_edit', :controller => 'definitions', :action => 'definition_edit'
  #map.resources :definitions, :member => {:definition_edit => :get}
  map.definition_edit 'definitions/:id/definition_edit', :controller => 'definitions', :action => 'definition_edit'
  map.definition_show 'definitions/:id/definition_show', :controller => 'definitions', :action => 'definition_show'
  map.analytical_note_edit 'definitions/:id/analytical_note_edit', :controller => 'definitions', :action => 'analytical_note_edit'
  map.analytical_note_show 'definitions/:id/analytical_note_show', :controller => 'definitions', :action => 'analytical_note_show'
  map.image_description_edit 'definitions/:id/image_description_edit', :controller => 'definitions', :action => 'image_description_edit'
  map.image_description_show 'definitions/:id/image_description_show', :controller => 'definitions', :action => 'image_description_show'
  map.audio_description_edit 'definitions/:id/audio_description_edit', :controller => 'definitions', :action => 'audio_description_edit'
  map.audio_description_show 'definitions/:id/audio_description_show', :controller => 'definitions', :action => 'audio_description_show'
  map.video_description_edit 'definitions/:id/video_description_edit', :controller => 'definitions', :action => 'video_description_edit'
  map.video_description_show 'definitions/:id/video_description_show', :controller => 'definitions', :action => 'video_description_show'
 

  map.edit_dynamic_etymology 'etymologies/:id/edit_dynamic_etymology', :controller => 'etymologies', :action => 'edit_dynamic_etymology'
  map.etymology_edit 'etymologies/:id/etymology_edit', :controller => 'etymologies', :action => 'etymology_edit'
  map.etymology_show 'etymologies/:id/etymology_show', :controller => 'etymologies', :action => 'etymology_show'
  map.etymology_analytical_note_edit 'etymologies/:id/analytical_note_edit', :controller => 'etymologies', :action => 'analytical_note_edit'
  map.etymology_analytical_note_show 'etymologies/:id/analytical_note_show', :controller => 'etymologies', :action => 'analytical_note_show'
  map.etymology_image_description_edit 'etymologies/:id/image_description_edit', :controller => 'etymologies', :action => 'image_description_edit'
  map.etymology_image_description_show 'etymologies/:id/image_description_show', :controller => 'etymologies', :action => 'image_description_show'
  map.etymology_audio_description_edit 'etymologies/:id/audio_description_edit', :controller => 'etymologies', :action => 'audio_description_edit'
  map.etymology_audio_description_show 'etymologies/:id/audio_description_show', :controller => 'etymologies', :action => 'audio_description_show'
  map.etymology_video_description_edit 'etymologies/:id/video_description_edit', :controller => 'etymologies', :action => 'video_description_edit'
  map.etymology_video_description_show 'etymologies/:id/video_description_show', :controller => 'etymologies', :action => 'video_description_show'

  map.edit_dynamic_translation 'translations/:id/edit_dynamic_translation', :controller => 'translations', :action => 'edit_dynamic_translation'
  map.translation_translation_edit 'translations/:id/translation_edit', :controller => 'translations', :action => 'translation_edit'
  map.translation_translation_show 'translations/:id/translation_show', :controller => 'translations', :action => 'translation_show'
  map.translation_analytical_note_edit 'translations/:id/analytical_note_edit', :controller => 'translations', :action => 'analytical_note_edit'
  map.translation_analytical_note_show 'translations/:id/analytical_note_show', :controller => 'translations', :action => 'analytical_note_show'


  map.edit_dynamic_spelling 'spellings/:id/edit_dynamic_spelling', :controller => 'spellings', :action => 'edit_dynamic_spelling'
  map.spelling_analytical_note_edit 'spellings/:id/analytical_note_edit', :controller => 'spellings', :action => 'analytical_note_edit'
  map.spelling_analytical_note_show 'spellings/:id/analytical_note_show', :controller => 'spellings', :action => 'analytical_note_show'
  map.spelling_image_description_edit 'spellings/:id/image_description_edit', :controller => 'spellings', :action => 'image_description_edit'
  map.spelling_image_description_show 'spellings/:id/image_description_show', :controller => 'spellings', :action => 'image_description_show'
  map.spelling_audio_description_edit 'spellings/:id/audio_description_edit', :controller => 'spellings', :action => 'audio_description_edit'
  map.spelling_audio_description_show 'spellings/:id/audio_description_show', :controller => 'spellings', :action => 'audio_description_show'
  map.spelling_video_description_edit 'spellings/:id/video_description_edit', :controller => 'spellings', :action => 'video_description_edit'
  map.spelling_video_description_show 'spellings/:id/video_description_show', :controller => 'spellings', :action => 'video_description_show'

  map.edit_dynamic_translation_equivalent 'translation_equivalents/:id/edit_dynamic_translation_equivalent', :controller => 'translation_equivalents', :action => 'edit_dynamic_translation_equivalent'
  map.translation_equivalent_translation_equivalent_edit 'translation_equivalents/:id/translation_equivalent_edit', :controller => 'translation_equivalents', :action => 'translation_equivalent_edit'
  map.translation_equivalent_translation_equivalent_show 'translation_equivalents/:id/translation_equivalent_show', :controller => 'translation_equivalents', :action => 'translation_equivalent_show'
  map.translation_equivalent_analytical_note_edit 'translation_equivalents/:id/analytical_note_edit', :controller => 'translation_equivalents', :action => 'analytical_note_edit'
  map.translation_equivalent_analytical_note_show 'translation_equivalents/:id/analytical_note_show', :controller => 'translation_equivalents', :action => 'analytical_note_show'
  map.translation_equivalent_image_description_edit 'translation_equivalents/:id/image_description_edit', :controller => 'translation_equivalents', :action => 'image_description_edit'
  map.translation_equivalent_image_description_show 'translation_equivalents/:id/image_description_show', :controller => 'translation_equivalents', :action => 'image_description_show'


  map.edit_dynamic_pronunciation 'pronunciations/:id/edit_dynamic_pronunciation', :controller => 'pronunciations', :action => 'edit_dynamic_pronunciation'
  map.pronunciation_analytical_note_edit 'pronunciations/:id/analytical_note_edit', :controller => 'pronunciations', :action => 'analytical_note_edit'
  map.pronunciation_image_description_edit 'pronunciations/:id/image_description_edit', :controller => 'pronunciations', :action => 'image_description_edit'
  map.pronunciation_audio_description_edit 'pronunciations/:id/audio_description_edit', :controller => 'pronunciations', :action => 'audio_description_edit'
  map.pronunciation_video_description_edit 'pronunciations/:id/video_description_edit', :controller => 'pronunciations', :action => 'video_description_edit'

  map.edit_dynamic_literary_quotation 'literary_quotations/:id/edit_dynamic_literary_quotation', :controller => 'literary_quotations', :action => 'edit_dynamic_literary_quotation'  
  map.literary_quotation_passage_edit 'literary_quotations/:id/passage_edit', :controller => 'literary_quotations', :action => 'passage_edit'
  map.literary_quotation_analytical_note_edit 'literary_quotations/:id/analytical_note_edit', :controller => 'literary_quotations', :action => 'analytical_note_edit'
  map.literary_quotation_image_description_edit 'literary_quotations/:id/image_description_edit', :controller => 'literary_quotations', :action => 'image_description_edit'
  map.literary_quotation_audio_description_edit 'literary_quotations/:id/audio_description_edit', :controller => 'literary_quotations', :action => 'audio_description_edit'
  map.literary_quotation_video_description_edit 'literary_quotations/:id/video_description_edit', :controller => 'literary_quotations', :action => 'video_description_edit'
  map.meta_metadata_note_edit 'metas/:id/metadata_note_edit', :controller => 'metas', :action => 'metadata_note_edit'

  map.meta_metadata_edit_dynamic_meta 'metas/:id/edit_dynamic_meta', :controller => 'metas', :action => 'edit_dynamic_meta'

  map.source_source_note_edit 'sources/:id/source_note_edit', :controller => 'sources', :action => 'source_note_edit'
  
  map.source_source_edit_dynamic_source 'sources/:id/edit_dynamic_sources', :controller => 'sources', :action => 'edit_dynamic_source'
  
  
  map.edit_dynamic_model_sentence 'model_sentences/:id/edit_dynamic_model_sentence', :controller => 'model_sentences', :action => 'edit_dynamic_model_sentence'
  map.model_sentence_model_sentence_edit 'model_sentences/:id/model_sentence_edit', :controller => 'model_sentences', :action => 'model_sentence_edit'
  map.model_sentence_analytical_note_edit 'model_sentences/:id/analytical_note_edit', :controller => 'model_sentences', :action => 'analytical_note_edit'
  map.model_sentence_image_description_edit 'model_sentences/:id/image_description_edit', :controller => 'model_sentences', :action => 'image_description_edit'
  map.model_sentence_audio_description_edit 'model_sentences/:id/audio_description_edit', :controller => 'model_sentences', :action => 'audio_description_edit'
  map.model_sentence_video_description_edit 'model_sentences/:id/video_description_edit', :controller => 'model_sentences', :action => 'video_description_edit'

  
  map.edit_dynamic_oral_quotation 'oral_quotations/:id/edit_dynamic_oral_quotation', :controller => 'oral_quotations', :action => 'edit_dynamic_oral_quotation'  
  map.oral_quotation_analytical_note_edit 'oral_quotations/:id/analytical_note_edit', :controller => 'oral_quotations', :action => 'analytical_note_edit'
  map.oral_quotation_image_description_edit 'oral_quotations/:id/image_description_edit', :controller => 'oral_quotations', :action => 'image_description_edit'
  map.oral_quotation_audio_description_edit 'oral_quotations/:id/audio_description_edit', :controller => 'oral_quotations', :action => 'audio_description_edit'
  map.oral_quotation_video_description_edit 'oral_quotations/:id/video_description_edit', :controller => 'oral_quotations', :action => 'video_description_edit'
 
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
