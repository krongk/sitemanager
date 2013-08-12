RailsComposerApp2::Application.routes.draw do

  # resources :site_items do
  #   collection do
  #     get :tag
  #   end
  # end

  devise_for :users
  resources :users

  get "home/index"
  root :to => "home#index"
end