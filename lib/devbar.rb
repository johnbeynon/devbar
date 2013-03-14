require "devbar/version"

module Rack
  class DevBar
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, body  = @app.call(env)

      body.each do |part|
        if part =~ /<\/body>/
          part.sub!(/<\/body>/, "#{bar}</body>")

          if headers['Content-Length']
            headers['Content-Length'] = (headers['Content-Length'].to_i + bar.length).to_s
          end

          break
        end
      end

      [status, headers, body]
    end

    def bar
      "<div style='height:30px;width:100%;background:red;bottom:0;padding:5px;font-weight:bold:0;position:fixed;right:0;text-align:center;font-weight:bold;color:white;z-index:999;opacity:0.7;transition:opacity .15s;-webkit-transition:opacity .15s' onmouseover='this.style.opacity=0.1' onmouseout='this.style.opacity=0.7'>#{ Rails.env.upcase } ENVIRONMENT</div>"
    end
  end
end
