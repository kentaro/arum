module Arum
  class Initializer
    def self.init(app)
      app.middleware.insert_after ActionDispatch::Callbacks, Arum::Middleware

      Arum.locale_base_dir ||= File.expand_path("../config/arum", Rails.root)
      I18n.backend ||= Arum::I18nBackend.new

      ActiveSupport.on_load(:action_controller) do
        ActionController::Base.send(:include, Helper)
      end
    end
  end

  module Helper
    def enable_arum
      Thread.current[:arum_enabled] = true

      unless I18n.backend.respond_to?(:translate_without_arum)
        I18n.backend.extend(
          Module.new {
            orig_method = I18n.backend.method(:translate)

            define_method :translate_without_arum do |*args|
              orig_method.call(*args)
            end

            define_method :translate do |locale, key, options = {}|
              if Thread.current[:arum_enabled]
                Thread.current[:arum_i18n_keys] ||= []
                Thread.current[:arum_i18n_keys].push(key)
              end

              orig_method.call(locale, key, options)
            end
          }
        )
      end
    end

    def arum_enabled?
      !!Thread.current[:arum_enabled]
    end
  end
end
