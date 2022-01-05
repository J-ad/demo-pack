# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    def create
      render json: ::Api::Users::CreatorService.call(user_params), status: :created
    end

    def index
      # TODO: extract user index logic to service, use serializer, add pagination?
      @users = User.all

      render json: @users
    end

    def show
      # TODO: use serializer
      @user = User.find(params[:id])

      render json: @user
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :total_orders_pln, :total_orders_eur)
    end
  end
end
