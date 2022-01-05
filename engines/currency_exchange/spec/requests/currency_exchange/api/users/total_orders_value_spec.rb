# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::Users::TotalOrdersValues", type: :request do
  describe "POST /convert" do
    context "happy path" do
      it "returns the correct value and persists User" do
        # user = create(:currency_exchange_user)
        params = {
          external_id: "12",
          base_value: "1",
          base_value_currency: "USD"
          # calculated_value: "1",
          # calculated_value_currency: "EUR"
        }

        post "/api/users/total_orders_value/convert", params: params

        expect(response).to have_http_status(:ok)
        expect(response.body).to eq({
          external_id: "12",
          base_value: "1",
          base_value_currency: "USD",
          calculated_value: "1",
          calculated_value_currency: "EUR"
        }.to_json)
      end
    end
  end
end
