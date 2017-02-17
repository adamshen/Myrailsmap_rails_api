class CheckRecord < ApplicationRecord
  belongs_to :check_card

  before_save :set_clear

  serialize :content

  validate :match_items, :only_one_in_period


  def set_clear
    self.clear = content.values.reduce(&:&)
  end

  def match_items
    item_names = check_card.check_items.pluck(:name)
    errors.add(:content_invalid, ' - content key names not match card item names') unless item_names == content.keys
  end

  def only_one_in_period
    errors.add(:already_checked, ' - this card is already checked in this period') if already_check_in_period?
  end

  private
  def already_check_in_period?
    time_cst = check_time.in_time_zone("Beijing")

    period_range = case check_card.period
                     when 'daily'
                       time_cst.beginning_of_day..time_cst.end_of_day
                     when 'weekly'
                       time_cst.beginning_of_week..time_cst.end_of_week
                     when 'monthly'
                       time_cst.beginning_of_month..time_cst.end_of_month
                   end

    CheckRecord.where(check_card: check_card, check_time: period_range).any?
  end
end
