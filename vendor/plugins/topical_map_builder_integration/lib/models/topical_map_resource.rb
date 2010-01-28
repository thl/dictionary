class TopicalMapResource < ActiveResource::Base
  self.site = ENV['RAILS_ENV']=='production' ? 'http://tmb.thlib.org/' : 'http://tmb.thlib.org/'
  # self.timeout = 10
end