class AddClearToCheckRecord < ActiveRecord::Migration[5.0]
  def change
    add_column :check_records, :clear, :boolean
  end
end
