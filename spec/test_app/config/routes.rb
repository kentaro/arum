TestApp::Application.routes.draw do
  root 'root#index'

  get '/arum/default' => 'arum#default'
  get '/arum/enabled' => 'arum#enabled'

  get '/i18n/no_translation'  => 'i18n#no_translation'
  get '/i18n/has_translation' => 'i18n#has_translation'

  mount Arum::Engine => '/arum'
end
