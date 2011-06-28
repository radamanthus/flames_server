Flames::Application.routes.draw do
  root :to => "home#index"

  resources :stories do
  end
end
