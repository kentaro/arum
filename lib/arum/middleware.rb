require "erb"

module Arum
  class Middleware
    def initialize(app, options={})
      @app     = app
      @options =  options

      template_file = @options[:template] || File.expand_path(
        "../templates/arum.erb",
        __FILE__
      )
      @template = ERB.new(File.read(template_file))
    end

    def call(env)
      dup._call(env)
    end

    def _call(env)
      @env = env
      @status, @headers, @body = @app.call(env)

      if enabled?
        load_translations!
        [@status, @headers, self]
      else
        [@status, @headers, @body]
      end
    end

    def enabled?
      Thread.current[:arum_enabled] && @headers['Content-Type'] =~ /html/
    end

    def load_translations!
      @translations = {}

      (Thread.current[:arum_i18n_keys] || []).each do |key|
        [:ja, :en, :fr].each do |locale|
          @translations[key] ||= {}
          @translations[key][locale] =
            begin
              I18n.config.backend.translate_without_arum(locale, key) || ''
            rescue
              ''
            end
        end
      end
    end

    def each(&block)
      @body.each do |part|
        part.gsub!(%r{</body>}, @template.result(binding) + "</body>")
        block.call(part)
      end
    end
  end
end
