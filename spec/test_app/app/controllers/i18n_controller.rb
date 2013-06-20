class I18nController < ApplicationController
  before_filter :enable_arum, only: [:no_translation, :has_translation]

  def no_translation
  end

  def has_translation
  end
end
