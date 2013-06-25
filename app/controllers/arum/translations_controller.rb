module Arum
  class TranslationsController < ApplicationController
    before_filter :check_arum_enabed

    def edit
    end

    private

    def check_arum_enabed
      unless arum_enabled?
        render json: {}, status: 403
      end
    end
  end
end
