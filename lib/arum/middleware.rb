require 'erb'

module Arum
  class Middleware
    def initialize(app, options={})
      @app     = app
      @options =  options
    end

    def translations
      @env['arum.translations'] ||= {}
    end

    def call(env)
      dup._call(env)
    end

    def _call(env)
      @env = env
      @status, @headers, @body = @app.call(env)

      return [@status, @headers, @body] unless html?

      response = Rack::Response.new([], @status, @headers)

      @body.each do |fragment|
        response.write(inject(fragment))
      end
      @body.close if @body.respond_to?(:close)

      response.finish
    end

    def html?
      @headers['Content-Type'] =~ /html/
    end

    def inject(fragment)
      template_file = @options[:template] ||
                      File.expand_path("../templates/arum.erb", __FILE__)
      @template ||= ERB.new(File.read(template_file))

      fragment.gsub(%r[</body>], @template.result(binding) + "</body>")
    end
  end
end
