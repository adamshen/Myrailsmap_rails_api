class AddArticleTopicRefToArticles < ActiveRecord::Migration[5.0]
  def change
    add_reference :articles, :article_topic, foreign_key: true
  end
end
