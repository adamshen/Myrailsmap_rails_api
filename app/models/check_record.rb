class CheckRecord < ApplicationRecord
  belongs_to :check_card

  before_save :set_clear

  serialize :content

  def set_clear
    self.clear = content.values.reduce(&:&)
  end
end
