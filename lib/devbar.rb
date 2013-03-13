require "devbar/version"

module Rack
  class DevBar
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)

      if headers["Content-Type"].include? "text/html"
        full_body = response.body
        full_body.sub! /<\/body>/, bar + "</body>"
        response.body = full_body
      end

      [status, headers, response]
    end

    def bar
      "<div style='height:30px;width:100%;background:red;bottom:0;padding:5px;font-weight:bold:0;position:fixed;right:0;text-align:center;font-weight:bold;color:white;z-index:999;opacity:0.7;'>#{ ENV['RAILS_ENV'].upcase } ENVIRONMENT</div>"
    end
  end
end
