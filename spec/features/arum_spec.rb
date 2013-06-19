require 'spec_helper'

describe 'foo bar' do
  before {
  }

  describe 'GET /' do
    context 'with no preferred language' do
      before { visit '/' }

      it {
        expect(page).to have_content /arum/
      }
    end
  end
end
