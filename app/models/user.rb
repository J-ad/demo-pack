class User < ApplicationRecord
  validates :name, :email, :total_orders_pln, :total_orders_eur, presence: true
  validates :total_orders_pln, :total_orders_eur, numericality: { only_integer: true }
end
