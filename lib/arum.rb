module Arum
  mattr_accessor :template_file, :available_locales, :locale_base_dir

  require "arum/version"
  require "arum/engine"
  require "arum/middleware"
  require "arum/initializer"
  require "arum/i18n_backend"
end
