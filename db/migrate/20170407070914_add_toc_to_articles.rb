class AddTocToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :toc, :text
  end
end
