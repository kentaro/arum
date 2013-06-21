module Arum
  mattr_accessor :template_file, :available_locales

  require "arum/version"
  require "arum/engine"
  require "arum/middleware"
  require "arum/initializer"
end
