# frozen_string_literal: true

module CurrencyExchange
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
