class Api::CheckRecordsController < ApplicationController
  before_action :authenticate_api_user!, only: :create

  def count
    requires! :email

    user_id = User.find_by!(email: params[:email]).id
    period = params[:period] || 'daily'
    check_cards = CheckCard.where(user: user_id, period: period)

    record_count = check_cards.map do |check_card|
      {
          card: check_card.title,
          all: check_card.check_records.size,
          finish: check_card.check_records.select(&:clear).size
      }
    end
    render json: record_count
  end

  def create
    requires! :check_card_id, :check_result

    check_result = params[:check_result]
    check_card = CheckCard.find(params[:check_card_id])
    raise ApplicationController::Forbidden  unless current_api_user == check_card.user
    # Todo: check if result match items

    check_record = CheckRecord.create!(check_card_id: check_card.id, content: check_result)
    render json: check_record
  end
end
