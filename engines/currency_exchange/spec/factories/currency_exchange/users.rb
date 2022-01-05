FactoryBot.define do
  factory :currency_exchange_user, class: 'CurrencyExchange::User' do
    external_id { "" }
    base_value { 1 }
    base_value_currency { "MyString" }
    calculated_value { 1 }
    calculated_value_currency { "MyString" }
  end
end
