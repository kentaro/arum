require 'spec_helper'

describe Arum::TranslationsController do
  describe 'PUT /arum/translations' do
    context 'when dispatch to a path on which Arum is not enabled' do
      before {
        post :edit, use_route: :arum, translation: {
          locale: 'ja', key: 'foo.bar.baz', translation: 'テスト'
        }
      }

      it { expect(response.status).to be == 403 }
    end
  end
end
