# frozen_string_literal: true
# This migration comes from currency_exchange (originally 20220105124103)

class CreateCurrencyExchangeUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :currency_exchange_users do |t|
      t.uuid :external_id
      t.integer :base_value
      t.string :base_value_currency
      t.integer :calculated_value
      t.string :calculated_value_currency

      t.timestamps
    end
  end
end
