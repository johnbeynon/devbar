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
      %(<div style="height:24px;width:100%;font-size:12px;font-family:helvetica,arial;background-color:red;bottom:0;position:fixed;right:0; text-align:center;color:white;z-index:999;opacity:0.7;line-height:24px;font-weight:bold;" onmouseover="if(this.style.bottom=='0px'){this.style.top=0;this.style.bottom=null}else{this.style.bottom=0;this.style.top=null}">#{ Rails.env.upcase } ENVIRONMENT</div>)
    end
  end
end
