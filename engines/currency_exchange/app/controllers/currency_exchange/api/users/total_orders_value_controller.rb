# frozen_string_literal: true

require_dependency "currency_exchange/application_controller"

module CurrencyExchange
  module Api
    module Users
      class TotalOrdersValueController < ApplicationController
        def convert
          TotalOrdersValueCalculatorService.new(user_params).call

          render json: {
            external_id: "12",
            base_value: "1",
            base_value_currency: "USD",
            calculated_value: "1",
            calculated_value_currency: "EUR"
          }
        end

        private

        def user_params
          params.permit(:external_id, :base_value, :base_value_currency)
        end
      end
    end
  end
end
