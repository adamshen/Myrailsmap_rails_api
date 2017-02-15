class CheckCard < ApplicationRecord
  has_many :check_items
  has_many :check_records
  belongs_to :user
end
