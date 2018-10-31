# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do |i|
  Client.create(email: "client_#{i}@example.com", first_name: "first_name#{i}", last_name: "last_name#{i}", phone: "123456789#{i}")
end

10.times do |i|
  Variation.create(name: "variation#{i}")
end

10.times do |i|
  Location.create(street_address: "A #{i} New Your City", country: "US", city: "New York", zip_code: "1000#{i}")  
end

30.times do |i|
  Purchase.create(referrer: i+1, purchased_at_price: 100 - i,  )
    
end

Purchase.all.each_with_index do |pur, index|
  loc_id = Location.all.collect(&:id).sample
  Slot.create!(begin_at: Date.today - (index+1).week, end_at: Date.today - (index+1).day, purchase_id: pur.id, location_id: loc_id)
  
end

Slot.all.each do |slot|
  variation_id = Variation.all.collect(&:id).sample
  slot.slot_variations.create(variation_id: variation_id, price: 22.00)
end




Slot.all.each_with_index do |slot, index|
  if index%2 == 0
    status = "canceled"
  else
    status = "active"
  end
  client_id = Client.all.collect(&:id).sample
  Appointment.create(slot_id: slot.id, client_id: client_id, status: status)
end