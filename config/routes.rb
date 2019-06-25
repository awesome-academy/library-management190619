Rails.application.routes.draw do
  root "static_pages#home"

  devise_for :users, controllers: {sessions: "sessions"}
  devise_scope :user do
    get "signin", to: "sessions#new"
    post "signin", to: "sessions#create"
    delete "logout", to: "sessions#destroy"
  end

  post "/rate" => "rater#create", :as => "rate"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  delete "/delete_publisher", to: "admin/publishers#destroy"
  delete "/delete_author", to: "admin/authors#destroy"
  delete "/delete_category", to: "admin/categories#destroy"
  delete "/delete_user", to: "admin/users#destroy"
  delete "/delete_book", to: "admin/book#destroy"
  post "/grant_admin", to: "admin/users#update"

  namespace :admin do
    resources :static_pages
    resources :books
    resources :users
    resources :publishers
    resources :authors
    resources :categories
  end

  resources :books
  resources :rates
  resources :books do
    resources :votes, only: [:create, :destroy]
  end
  resources :comments
end
