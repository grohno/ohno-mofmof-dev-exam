Rails.application.routes.draw do
  root 'rentals#index'
  resources :rentals do
    collection do
      post :confirm
    end
  end
end
