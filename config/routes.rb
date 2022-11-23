Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
<<<<<<< HEAD
  resources :pets do
    resources :bookings # , only: [:new, :create, :index, :show, :update, :edit, :destroy]
=======
  resources :pets, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do
      get :my_pets
    end
>>>>>>> 59b35f7f7268b9eda6539f4aa65fc2e6ef276f85
  end
end
