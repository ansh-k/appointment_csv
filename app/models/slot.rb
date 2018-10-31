class Slot < ApplicationRecord

  has_one :appointment
  belongs_to :purchase
  belongs_to :location
  has_many :slot_variations

  scope :with_referrer, -> { joins(:purchase).where.not("purchases.referrer = ''").collect(&:purchase) }
  scope :without_referrer, -> { joins(:purchase).where.not("purchases.referrer = ''").collect(&:purchase) }
  
end
