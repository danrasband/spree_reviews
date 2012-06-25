Spree::Core::Engine.routes.draw do

  # Add your extension routes here
  namespace :admin do
    resources :products do
      resources :reviews
      resource :review_settings
    end
  end

  resources :products do
    resources :reviews
  end
end
