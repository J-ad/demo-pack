# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

  private

  def record_not_found
    render json: "404 Not Found", status: 404
  end

  def unprocessable_entity
    render json: "422 Unprocessable Entity", status: 422
  end
end
