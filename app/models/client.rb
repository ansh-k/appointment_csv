require "csv"

class Client < ApplicationRecord
  has_many :appointments


  def full_name
    [first_name, last_name].join(" ")
  end

  def client_fields
    [id, full_name, phone, email]
  end


end
