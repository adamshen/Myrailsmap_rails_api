class CreateCheckRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :check_records do |t|
      t.string :content
      t.belongs_to :check_card, index: true

      t.timestamps
    end
  end
end
