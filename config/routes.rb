Rails.application.routes.draw do
  resources :events
  root 'welcome#index'
  get "/auth/:provider/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy", as: :logout
  resource :retirements, only: %i[new create]
  resources :events, only: %i[new create show edit update destroy] do
    resources :tickets, onl: %i[new create destroy]
  end
  get 'status' => 'status#index', defaults: { format: 'json' }
  match "*path" => "application#error404", via: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
