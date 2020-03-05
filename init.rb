require 'webrick'
require_relative 'init_cgi.rb'
require_relative 'template_generator.rb'

class WebServer
  def initialize
    @server = WEBrick::HTTPServer.new({
      :DocumentRoot => '.',
      :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
      :Port => '3000',
    })
    ['INT', 'TERM'].each {|signal|
      Signal.trap(signal){ @server.shutdown }
    }
    @data_store = WEBrick::Cookie.new("values", "")
  end

  def set_html(url, file_path)
    @server.mount(url, WEBrick::HTTPServlet::ERBHandler, file_path)
  end

  def set_action(url, file_path)
    @server.mount(url, WEBrick::HTTPServlet::CGIHandler, file_path)
  end

  def start
    @server.start
  end
end