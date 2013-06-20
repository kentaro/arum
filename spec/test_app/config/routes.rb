TestApp::Application.routes.draw do
  # To test whether or not `enable_arum` works correctly
  get '/arum/default' => 'arum#default'
  get '/arum/enabled' => 'arum#enabled'

  get '/i18n/no_translation'  => 'i18n#no_translation'
  get '/i18n/has_translation' => 'i18n#has_translation'
end
