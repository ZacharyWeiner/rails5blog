Rails.application.routes.draw do
  devise_for :users, path:'', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :topics
  resources :portfolios, except: [:show] do 
    put :sort, on: :collection
  end 
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  get 'tech-news', to: 'pages#tech_news'
  resources :blogs do 
    member do 
      get :toggle_status
    end
  end

  root to: "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
