class CheckItem < ApplicationRecord
  belongs_to :check_card

  validates :name, length: { in: 2..30 }, uniqueness: true
  validates :label, length: { in: 2..50 }
end
