Spree::Core::Engine.routes.draw do

  # Add your extension routes here
  namespace :admin do
    resources :reviews do
      member do
        get :approve
      end
    end
    resource :review_settings
  end

  resources :products do
    resources :reviews
  end
end
