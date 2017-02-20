class Api::CheckCardsController < ApplicationController
  def search
    requires! :email

    user = User.find_by!(email: params[:email])
    cards_with_items = user.check_cards.map do |check_card|
      check_card.serializable_hash(methods: [:check_items, :record_in_period])
    end
    render json: cards_with_items
  end
end
