class CreateCheckCards < ActiveRecord::Migration[5.0]
  def change
    create_table :check_cards do |t|
      t.string :name
      t.string :title
      t.integer :level
      t.integer :submit_times
      t.integer :finish_times

      t.timestamps
    end
  end
end
