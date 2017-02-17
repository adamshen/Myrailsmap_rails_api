class CheckCard < ApplicationRecord
  has_many :check_items
  has_many :check_records
  belongs_to :user

  validates :name, length: { in: 2..30 }, uniqueness: true
  validates :title, length: { in: 2..50 }
  validates :period, inclusion: {in: %w(daily weekly monthly)}
end
