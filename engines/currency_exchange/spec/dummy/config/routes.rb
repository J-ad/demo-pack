Rails.application.routes.draw do
  mount CurrencyExchange::Engine => "/currency_exchange"
end
