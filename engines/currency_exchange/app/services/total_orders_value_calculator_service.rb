# frozen_string_literal: true

class TotalOrdersValueCalculatorService
  require 'net/http'

  def initialize(params)
    # TODO: add dry-validation for params
    @params = params
  end

  def self.call(params)
    new(params).call
  end

  def call
    extend_params_by_calculated_value

    @user = CurrencyExchange::User.new(@params)

    raise ActiveRecord::RecordInvalid, @user unless @user.save

    serialize_result
  end

  private

  attr_reader :user

  def extend_params_by_calculated_value
    @params[:calculated_value] =  (@params[:base_value] * 10000) / exchange_rate

    # TODO: add propper error handling
  rescue StandardError => e
    Rails.logger.error("Error while calculating exchange rate: #{e.message}")

    true
  end

  def exchange_rate
    return @exchange_rate if defined?(@exchange_rate)
    # TODO: implement external API call in a separated library + service to handle different currencies + apis
    url = URI.parse('http://api.nbp.pl/api/exchangerates/rates/a/eur/')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }

    @exchange_rate = (JSON.parse(res.body)["rates"].first["mid"] * 10000).to_i
  end

  def serialize_result
    {
      base_value: user.base_value,
      base_value_currency: user.calculated_value_currency,
      calculated_value_currency: user.calculated_value_currency,
      calculated_value: user.calculated_value
    }
  end
end
