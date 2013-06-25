require 'yaml'

module Arum
  class I18nBackend < I18n::Backend::Simple
    def store_translations(locale, data, options = {})
      super

      FileUtils.mkdir_p(Arum.locale_base_dir)
      filename = File.expand_path("#{locale}.yml", Arum.locale_base_dir)

      open(filename, "w") do |f|
        obj_to_be_dumpped = { locale => translations[locale.to_sym] }
        YAML.dump(obj_to_be_dumpped, f)
      end
    end
  end
end
