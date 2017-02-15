class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  def requires!(*attrs)
    attrs.each do |attr|
      raise ActionController::ParameterMissing.new(attr) unless params[attr].present?
    end
  end

  rescue_from(ActionController::ParameterMissing) do |err|
    render json: { error: 'ParameterInvalid', message: err }, status: :bad_request
  end

  rescue_from(ActiveRecord::RecordNotFound) do
    render json: { error: 'ResourceNotFound' }, status: :not_found
  end
end
