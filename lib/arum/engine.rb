require "arum/middleware"
require "arum/initializer"

module Arum
  class Engine < Rails::Engine
    initializer "arum_engine.add_middleware" do |app|
      Arum::Initializer.init(app)
    end
  end
end
