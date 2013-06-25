require 'spec_helper'

describe Arum::TranslationsController do
  before {
    I18n.backend = Arum::I18nBackend.new
    Arum.locale_base_dir = File.expand_path("../test_app/config/locales/arum", Rails.root)
  }

  describe 'PUT /arum/translations' do
    context 'when dispatch to a path on which Arum is not enabled' do
      before {
        put :edit, use_route: :arum, translation: {
          locale: 'en', key: 'foo.bar.baz', translation: 'test'
        }
      }

      it { expect(response.status).to be == 200 }
    end
  end
end
