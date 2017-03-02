class CreateArticleTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :article_topics do |t|
      t.string :name

      t.timestamps
    end
  end
end
