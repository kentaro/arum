TestApp::Application.routes.draw do
  # To test whether or not `enable_arum` works correctly
  get '/arum/default' => 'arum#default'
  get '/arum/enabled' => 'arum#enabled'

  get '/i18n/default' => 'i18n#default'
  get '/i18n/enabled' => 'i18n#enabled'
end
