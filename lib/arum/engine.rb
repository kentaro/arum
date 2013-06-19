require 'arum/middleware'

module Arum
  class Engine < Rails::Engine
    initializer "arum_engine.add_middleware" do |app|
      app.middleware.insert_after ActionDispatch::Callbacks, Arum::Middleware
    end
  end
end
