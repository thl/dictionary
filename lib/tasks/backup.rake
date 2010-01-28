require 'ya2yaml'

namespace :db do
  namespace :backup do
    
    def interesting_tables
      ActiveRecord::Base.connection.tables.sort #.reject! do |tbl|
      #   ['schema_info', 'sessions', 'public_exceptions'].include?(tbl)
      # end
    end
  
    desc "Dump entire db."
    task :write => :environment do 

      dir = RAILS_ROOT + '/db/backup'
      FileUtils.mkdir_p(dir)
      FileUtils.chdir(dir)
    
      interesting_tables.each do |tbl|

        begin
          klass = tbl.classify.constantize
          puts "Writing #{tbl}..."
          # File.open("#{tbl}.yml", 'w+') { |f| YAML.dump klass.find(:all).collect(&:attributes), f }      
          File.open("#{tbl}.yml", 'w+') { |f| 
            size = klass.count(:all)
            count = 0
            while count < size
              f.puts klass.find(:all).collect(&:attributes).ya2yaml
              # obj = klass.find(:all, :limit => 100, :offset => count)
              # obj.each do |o|
              #   f.puts o.ya2yaml
              # end
              # YAML.dump klass.find(:all, :limit => 100, :offset => count).collect(&:attributes), f
              count += 100
            end
           }      
        rescue
        end
        
      end
    
    end
  
    task :read => [:environment, 'db:schema:load'] do 

      dir = RAILS_ROOT + '/db/backup'
      FileUtils.mkdir_p(dir)
      FileUtils.chdir(dir)
    
      interesting_tables.each do |tbl|

        klass = tbl.classify.constantize
        ActiveRecord::Base.transaction do 
        
          puts "Loading #{tbl}..."
          YAML.load_file("#{tbl}.yml").each do |fixture|
            ActiveRecord::Base.connection.execute "INSERT INTO #{tbl} (#{fixture.keys.join(",")}) VALUES (#{fixture.values.collect { |value| ActiveRecord::Base.connection.quote(value) }.join(",")})", 'Fixture Insert'
          end        
        end
      end
    
    end
  
  end
end