# frozen_string_literal: true

CurrencyExchange::Engine.routes.draw do
  namespace :api do
    namespace :users do
      resource :total_orders_value, only: [] do
        post :convert
      end
    end
  end
end
