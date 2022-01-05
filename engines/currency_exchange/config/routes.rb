CurrencyExchange::Engine.routes.draw do
  namespace :api do
    resources :users, only: [:create, :show]
  end
end
