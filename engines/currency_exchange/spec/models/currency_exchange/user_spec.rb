# frozen_string_literal: true

require "rails_helper"

RSpec.describe CurrencyExchange::User, type: :model do
  it "persists a User" do
    create(:currency_exchange_user)

    expect(CurrencyExchange::User.count).to eq(1)
  end
end
