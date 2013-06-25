module Arum
  class TranslationsController < ApplicationController
    def edit
      I18n.backend.store_translations(
        params[:translation][:locale], {
          params[:translation][:key] => params[:translation][:translation]
        }
      )
      render json: {}, status: 200
    end
  end
end
