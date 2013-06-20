module Arum
  class Initializer
    def self.init(app)
      app.middleware.insert_after ActionDispatch::Callbacks, Arum::Middleware

      ActiveSupport.on_load(:action_controller) do
        ActionController::Base.send(:include, Helper)
      end
    end
  end

  module Helper
    def enable_arum
      Thread.current[:arum_enabled] = true

      I18n.config.backend.extend(
        Module.new {
          orig_method = I18n.config.backend.method(:translate)

          define_method :translate_without_arum do |*args|
            orig_method.call(*args)
          end

          def translate(locale, key, options = {})
            if Thread.current[:arum_enabled]
              Thread.current[:arum_i18n_keys] ||= []
              Thread.current[:arum_i18n_keys].push(key)
            end

            translate_without_arum(locale, key, options)
          end
        }
      )
    end

    def arum_enabled?
      !!Thread.current[:arum_enabled]
    end
  end
end
