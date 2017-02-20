class CheckCard < ApplicationRecord
  has_many :check_items
  has_many :check_records
  belongs_to :user

  validates :name, length: { in: 2..30 }, uniqueness: true
  validates :title, length: { in: 2..50 }
  validates :period, inclusion: { in: %w(daily weekly monthly) }

  def record_in_period(time = Time.now)
    time_cst = time.in_time_zone("Beijing")

    period_range = case period
                     when 'daily'
                       time_cst.beginning_of_day..time_cst.end_of_day
                     when 'weekly'
                       time_cst.beginning_of_week..time_cst.end_of_week
                     when 'monthly'
                       time_cst.beginning_of_month..time_cst.end_of_month
                   end

    CheckRecord.where(check_card: self.id, check_time: period_range).try(:take)
  end
end
