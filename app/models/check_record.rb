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
    record_in_period = check_card.record_in_period(check_time)

    if new_record?
      errors.add(:checked, ' - already checked in this period') if record_in_period
    else
      errors.add(:existed, ' - record in this period is existed') unless self.id == record_in_period&.id
    end
  end
end
