require 'spec_helper'

describe 'Enable/disable Arum' do
  describe 'GET *' do
    context 'when dispatch to a path on which Arum is not enabled' do
      before { visit '/arum_test/default' }

      it {
        expect(page).not_to have_css '#arum-panel'
      }
    end

    context 'when dispatch to a path on which Arum is enabled explicitely' do
      before { visit '/arum_test/enabled' }

      it {
        expect(page).to have_css '#arum-panel'
      }
    end
  end
end
