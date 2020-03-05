require_relative 'init.rb'

server = WebServer.new
server.set_html('/test', 'test.html.erb')
server.set_action('/indicate.cgi', 'init_cgi.rb')
server.start