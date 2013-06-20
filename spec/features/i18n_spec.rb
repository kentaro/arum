require 'spec_helper'

describe 'I18n wrapper' do
  describe '' do
    context 'when dispatch to a path on which Arum is not enabled' do
      before { visit '/i18n/default' }

      it {
        expect(page).to have_content /Hello world/
      }
    end

    context 'when dispatch to a path on which Arum is enabled explicitely' do
      before { visit '/i18n/enabled' }

      it {
        expect(page).to have_content /Hello world/
      }
    end
  end
end
