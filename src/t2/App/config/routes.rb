Rails.application.routes.draw do

  root 'pages#index'

  scope '(/:locale)' do
    resources :pages
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :pages

      match '*path' => 'api#preflight', :via => :options
    end
  end

end
