# frozen_string_literal: true

module Api
  module Users
    class CreatorService
      def initialize(params)
        @params = params
      end

      def self.call(params)
        new(params).call
      end

      def call
        extend_params
        @user = User.new(@params)

        raise ActiveRecord::RecordInvalid, @user unless @user.save

        calculate_exchange_rate(user)
      end

      private

      attr_reader :params, :user

      def extend_params
        @params[:total_orders_pln] = rand(1...10_000) unless @params[:total_orders_pln]
      end

      def calculate_exchange_rate
        # TODO: this could be done async
        TotalOrdersValueCalculatorService.call(params_for_exchange_rate_calculation)
      end

      def params_for_exchange_rate_calculation
        @params_for_exchange_rate_calculation ||= { external_id: user.id,
                                                    base_value: user.total_orders_pln,
                                                    base_value_currency: "PLN",
                                                    calculated_value_currency: "EUR" }
      end
    end
  end
end
