Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#home"

  get 'doctors/list_male', to: 'doctors#list_male', as: :list_male
  get 'doctors/list_female', to: 'doctors#list_female', as: :list_female
  
  resources :doctors

end
