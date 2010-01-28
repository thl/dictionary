# This file is only needed when the call to the template is in localhost. In such case, add the following line
# to the production environment:
# require 'vendor/plugins/thdl_integration/lib/open_uri_patch'

require 'open-uri'
require 'uri'

#
# Overrides the OpenURI #open method - Allows the server to do local requests without having to use external network.
#   - replaces the host in :mode with "127.0.0.1"
#   - creates a request header using the original host (in :mode) as the "Host: xxx" header
# @mode - url/path to open
# @*args - valid signatures:
#   - open('http://google.com', perm=:read, options={})
#   - open('http://google.com', options={})
#   the :perm argument can (and should) be ommitted
#
if defined?(OpenURI)
 def open(mode,*args)
   debugger
   uri=URI.parse(mode)
   # set the host request header
   host_opt={'host'=>uri.host}
   # if last arg is hash, merge new host header hash, else set entire request header option
   args[-1].is_a?(Hash) ? args[-1].merge(host_opt) : args<<host_opt
   # re-route for local loop-back
   uri.host='127.0.0.1'
   # call the parent open method
   super(uri.to_s, *args)
 end
end