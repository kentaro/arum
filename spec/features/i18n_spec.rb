require 'spec_helper'

describe 'I18n wrapper' do
  describe '' do
    context 'when dispatch to a path on which Arum is not enabled' do
      before { visit '/i18n/no_translation' }

      it { expect(page).to have_content %r{There's no sentence to be translated.} }
      it { expect(page).to have_css '#arum-panel' }
    end

    context 'when dispatch to a path on which Arum is enabled explicitely' do
      before { visit '/i18n/has_translation' }

      it { expect(page).to have_content /Hello world/        }
      it { expect(page).to have_css '#arum-panel'            }
      it { expect(page).to have_css '.arum-i18n-translation' }
    end
  end
end
