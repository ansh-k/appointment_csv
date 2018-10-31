class Location < ApplicationRecord
  has_many :slots
  has_many :appointments, through: :slots

  has_many :slot_variations, through: :slots
  def full_address
    [street_address, country, city, zip_code].join(", ")
  end

  def variation_names
    slot_variations.collect(&:variation).collect(&:name).join("|")
  end

  def location_fields
    [id, full_address, variation_names]
  end
end