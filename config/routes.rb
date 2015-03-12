Rails.application.routes.draw do
  devise_for :schools
  #define the root page
  root 'static_pages#home'
  get 'myscope' => 'scope#myscope'
  get 'help'    => 'static_pages#help'

  resources :languages

  resources :countries

  resources :percentages

  resources :schools, only: [:index, :edit, :update, :show]
end
