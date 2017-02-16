class AddPeriodToCheckCards < ActiveRecord::Migration[5.0]
  def change
    add_column :check_cards, :period, :string
  end
end
