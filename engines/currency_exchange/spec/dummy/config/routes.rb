# frozen_string_literal: true

Rails.application.routes.draw do
  mount CurrencyExchange::Engine => "/currency_exchange"
end
