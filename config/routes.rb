RailsComposerApp2::Application.routes.draw do

  


  resources :themes

  resources :site_posts
  resources :sites do
    resources :site_posts
  end
  match "s-(:id)" => "sites#show"
  match "s-(:site_id)/p-(:id)" => "site_posts#show"

  resources :site_steps

  resources :user_details

  resources :mail_tmps
  resources :mail_items

  resources :resource_items

  resources :sms_logs
  resources :sms_tmps
  resources :phone_items

  get "page/about"
  get "page/contact"
  get "page/protocol"
  get "page/right"
  get "page/join"
  get "page/subscribe"
  get "page/friend_links"
  get "page/documentation"
  get "page/help"
  
  post "/phone_send" => "phone_items#phone_send", :via => :post
  post "/mail_send" => "mail_items#mail_send", :via => :post
  
  devise_for :users
  resources :users

  get "home/index"
  get "home/sms"
  get "home/email"
  root :to => "home#index"
  authenticated :user do
    root :to => 'home#index'
  end
end