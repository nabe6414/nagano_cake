Rails.application.routes.draw do
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get 'customers/confirm'
    resources :customers, only: [:show, :edit, :update]
  end
  namespace :admin do
    get '/' => 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
  end
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
