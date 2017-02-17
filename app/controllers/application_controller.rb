class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  class Forbidden < StandardError
  end

  def requires!(*attrs)
    attrs.each do |attr|
      raise ActionController::ParameterMissing.new(attr) unless params[attr].present?
    end
  end

  rescue_from(ActiveRecord::RecordInvalid) do |err|
    render json: { error: 'RecordInvalid', message: err }, status: :unprocessable_entity
  end

  rescue_from(ActionController::ParameterMissing) do |err|
    render json: { error: 'ParameterInvalid', message: err }, status: :bad_request
  end

  rescue_from(Forbidden) do |err|
    render json: { error: 'Forbidden', message: err }, status: :forbidden
  end

  rescue_from(ActiveRecord::RecordNotFound) do
    render json: { error: 'ResourceNotFound' }, status: :not_found
  end
end
