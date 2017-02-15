class CreateCheckItems < ActiveRecord::Migration[5.0]
  def change
    create_table :check_items do |t|
      t.string :name
      t.string :label
      t.integer :level
      t.integer :submit_times
      t.integer :finish_times
      t.belongs_to :check_card, index: true

      t.timestamps
    end
  end
end
