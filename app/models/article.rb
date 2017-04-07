class Article < ApplicationRecord
  belongs_to :article_topic

  validates :title, length: { minimum: 3 }
  validates :content, length: { minimum: 10 }

  serialize :toc

  before_save :build_toc

  def build_toc
    self.toc = Kramdown::Document.new(content).to_toc.to_hash
  end
end
