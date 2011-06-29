Flames::Application.routes.draw do
  root :to => "home#index"

  resource :api do
    resource :story, :controller => "Api::Stories"
  end

  resources :stories do
  end
end
