class RootController < ApplicationController
  before_filter :enable_arum, only: [:index]

  def index
  end
end
