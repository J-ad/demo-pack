# frozen_string_literal: true

class TotalOrdersValueCalculatorService
  def initialize(params)
    # TODO: add dry-validation for params
    @params = params
  end

  def self.call(params)
    new(params).call
  end

  def call
    extend_params_by_calculated_value

    user = CurrencyExchange::User.new(@params)

    if user.save
      user
    else
      raise ActiveRecord::RecordInvalid, user
    end
  end

  private

  def extend_params_by_calculated_value
    @params[:calculated_value] = calculate_exchange_rate
  end

  def calculate_exchange_rate
    # TODO: implement external API call
    123
  end
end
