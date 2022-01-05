# frozen_string_literal: true

class User < ApplicationRecord
  # NOTE: should emails be unique?
  validates :email, presence: true, format: URI::MailTo::EMAIL_REGEXP
  validates :name, presence: true
  validates :total_orders_pln, :total_orders_eur, numericality: { only_integer: true }
end
