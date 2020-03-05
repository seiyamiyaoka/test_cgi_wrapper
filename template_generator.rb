class TemplateGenerator
  def self.use_html(values)
    "<html>
      <body>
        <p>受け取った文字列は下記になります</p>
        <p>文字列：#{values}</p>
      </body>
    </html>"
  end
end
