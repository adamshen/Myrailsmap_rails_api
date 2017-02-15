class AddUserRefToCheckCards < ActiveRecord::Migration[5.0]
  def change
    add_reference :check_cards, :user, foreign_key: true
  end
end
