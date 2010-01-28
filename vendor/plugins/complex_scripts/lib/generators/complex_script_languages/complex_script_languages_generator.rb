class ComplexScriptLanguagesGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.file 'languages_controller.rb', 'app/controllers/languages_controller.rb'
      m.file 'language.rb', 'app/models/language.rb'
      m.file 'languages_helper.rb', 'app/helpers/languages_helper.rb'
      m.directory 'app/views/languages'
      m.file 'index.html.erb', 'app/views/languages/index.html.erb'
      m.file 'show.html.erb', 'app/views/languages/show.html.erb'
      m.file 'edit.html.erb', 'app/views/languages/edit.html.erb'
      m.file 'new.html.erb', 'app/views/languages/new.html.erb'
      m.route_resources 'languages'
      m.migration_template 'migration.rb', 'db/migrate'
    end
  end
  
  def file_name
    'create_languages'
  end
end