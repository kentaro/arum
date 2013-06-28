TestApp::Application.routes.draw do
  root 'root#index'

  get '/arum_test/default' => 'arum_test#default'
  get '/arum_test/enabled' => 'arum_test#enabled'

  get '/i18n/no_translation'  => 'i18n#no_translation'
  get '/i18n/has_translation' => 'i18n#has_translation'

  mount Arum::Engine => '/arum'
end
