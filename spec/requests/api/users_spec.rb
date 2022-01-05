require 'rails_helper'

RSpec.describe "Api::Users", type: :request do
  describe "GET /index" do
    let(:users) { create_list(:user, 2) }

    it "returns a list of users" do
      get "/api/users"

      expect(response.body).not_to be_empty
    end
  end

  describe "GET /user/:id" do
    context "when user exists" do
      let(:user) { create(:user) }

      it "returns a user" do
        get "/api/users/#{user.id}"

        expect(response.body).not_to be_empty
        expect(parsed_json["name"]).to eq(user.name)
      end
    end

    context "when user does not exist" do
      it "returns an 404" do
        get "/api/users/wrong_id"

        expect(response.code).to eq("404")
      end
    end

  end

  describe "POST /users" do
    context "valid parameters" do
      let(:user_params) { {user: attributes_for(:user) }}

      it "returns a list of users" do
        post "/api/users", params: user_params

        expect(response.code).to eq("201")
        expect(parsed_json["name"]).to eq(user_params[:user][:name])
      end
    end

    context "invalid parameters" do
      context "missing required parameters" do
        let(:user_params) { {user: attributes_for(:user, name: nil) }}

        it "returns an error" do
          post "/api/users", params: user_params

          expect(response.code).to eq("422")
        end
      end

      context "invalid format" do
        let(:user_params) { {user: attributes_for(:user, email: "incorrect") }}

        it "returns an error" do
          post "/api/users", params: user_params

          expect(response.code).to eq("422")
        end
      end
    end
  end

  def parsed_json
    JSON.parse(response.body)
  end
end
