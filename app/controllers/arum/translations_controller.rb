module Arum
  class TranslationsController < ApplicationController
    skip_before_filter :verify_authenticity_token

    def create
      I18n.backend.store_translations_to_file(
        params[:locale], {
          params[:key] => params[:translation]
        }
      )
      render json: {}, status: 200
    end
  end
end
