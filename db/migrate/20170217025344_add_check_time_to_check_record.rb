class AddCheckTimeToCheckRecord < ActiveRecord::Migration[5.0]
  def change
    add_column :check_records, :check_time, :datetime
  end
end
