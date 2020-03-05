require_relative 'init.rb'
$input_values = []

server = WebServer.new
server.set_html('/test', 'test.html.erb')
server.set_action('/indicate.cgi', 'init_cgi.rb')
server.start