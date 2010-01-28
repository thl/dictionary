# Include hook code here
require 'open-uri'
#require 'open_uri_patch' if ENV['RAILS_ENV']!='development'
require 'hpricot'
require 'helpers/frame_helper'
require 'helpers/thdl_integration_helper'
ActionView::Base.send :include, ThdlIntegrationHelper
ActionView::Base.send :include, FrameHelper