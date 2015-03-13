Rails.application.routes.draw do
  devise_for :schools
  #define the root page
  root 'static_pages#home'
  get 'myscope' => 'scope#myscope'
  get 'help'    => 'static_pages#help'
  get 'admin'    => 'static_pages#admin'
  namespace :admin do
    resources :languages, :countries
  end
  resources :schools, only: [:index, :edit, :update, :show]
  resources :countries, only: [:index, :show]
  resources :languages, only: [:index, :show]
end
