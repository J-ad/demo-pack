# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    def create
      # TODO: extract user creation logic to service, use serializer
      @user = User.new(user_params)

      if @user.save
        render :show, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
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
