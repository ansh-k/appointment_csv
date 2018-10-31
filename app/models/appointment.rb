class Appointment < ApplicationRecord
  
  belongs_to :slot
  belongs_to :client
  has_one :location, through: :slot

  has_many :slot_variations, through: :slot
  scope :active_appointments, -> { where(status: 'active') }
  scope :canceled_appointments, -> { where(status: 'canceled') }

  scope :active_appointments_price, -> { active_appointments.collect(&:slot_variations).flatten.collect(&:price).sum }
  scope :canceled_appointments_price, -> { canceled_appointments.collect(&:slot_variations).flatten.collect(&:price).sum }

  def self.total_price
    collect(&:slot_variations).flatten.collect(&:price).sum
  end  
end
