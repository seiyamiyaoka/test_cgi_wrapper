require 'cgi'
require 'pry'
require_relative 'template_generator.rb'
ARGV.replace(%w(test=0))

class HttpHandler
  def initialize(type, charset)
    @cgi = CGI.new
    @type = type
    @charset = charset
  end

  def response
    @cgi.out("type" => @type, "charset" => @charset) {
      # 受け取ったデータcgi['input']で取り出し、ローカル変数に代入する
      # 目印の'input'から情報を取り出す
      @get = @cgi['input']
      File.open("data.txt", "r") do |f|
        @read_data = f.read
      end

      File.open("data.txt", "a") do |f|
        f.puts(@read_data + @get)
      end

      TemplateGenerator.use_html(@read_data + @get)
    }
  end
end

handler = HttpHandler.new("text/html", "UTF-8")

handler.response