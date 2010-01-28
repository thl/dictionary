module Rails
  module Generator
    module Commands
      class Create < Base
        def route_nested_resources(resources)
          sentinel = 'ActionController::Routing::Routes.draw do |map|'
          logger.route resources
          unless options[:pretend]
            gsub_file 'config/routes.rb', /(#{Regexp.escape(sentinel)})/mi do |match|
              "#{match}\n  #{resources}"
            end
          end
        end
      end
      
      class Destroy < RewindBase
        def route_nested_resources(resources)
          look_for = "\n  #{resources}"
          logger.route resources
          gsub_file 'config/routes.rb', /(#{Regexp.escape(look_for)})/mi, ''
        end
      end
    end
  end
end