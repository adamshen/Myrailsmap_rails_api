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
    errors.add(:content_invalid, 'content key names not match card item names') unless item_names == content.keys
  end

  def only_one_in_period
    errors.add(:already_checked, 'this card is already checked in this period') if already_check_in_period?
  end

  private
  def already_check_in_period?
    period_range = case check_card.period
                     when 'daily'
                       check_time.beginning_of_day..check_time.end_of_day
                     when 'weekly'
                       check_time.beginning_of_week..check_time.end_of_week
                     when 'monthly'
                       check_time.beginning_of_month..check_time.end_of_month
                   end

    CheckRecord.where(heck_card: check_card, check_time: period_range).any?
  end
end
