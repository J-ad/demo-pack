require 'rails_helper'

module CurrencyExchange
  RSpec.describe User, type: :model do
    it "persists a User" do
      user = create(:currency_exchange_user)

      expect(CurrencyExchange::User.count).to eq(1)
    end
  end
end
