Sticker::Integration::Api.routes.draw do
  get :access_token, controller: :base
  resources :collections, only: [] do
    collection do
      post :purchase
    end
  end
end