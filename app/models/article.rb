class Article < ApplicationRecord
  belongs_to :article_topic

  validates :title, length: { minimum: 3 }
  validates :content, length: { minimum: 10 }
end
