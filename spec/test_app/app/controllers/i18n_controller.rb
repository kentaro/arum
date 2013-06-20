class I18nController < ApplicationController
  before_filter :enable_arum, only: [:enabled]

  def default
  end

  def enabled
  end
end
