module ActiveResource
  class Base
    class << self
      # alias :old_find :find
      # def find(*arguments)
      #   begin
      #     return old_find(*arguments)
      #   rescue ActiveResource::TimeoutError
      #     return nil
      #   end
      # end
      
      private
      
      alias :old_find_single :find_single
      # Find a single resource from the default URL
      def find_single(scope, options)
        return nil if scope.nil?
        old_find_single(scope, options)
      end
    end
  end
end

# class ActiveResource::Connection
#   
#   original_initialize=self.instance_method(:initialize)
#   
#   define_method :initialize do |*args|
#     original_initialize.bind(self).call(*args)
#     @default_header = {'Host'=>site.host}
#     site.host='127.0.0.1'
#   end if ENV['RAILS_ENV']=='quandu_production' || ENV['RAILS_ENV']=='production'
#   
# end