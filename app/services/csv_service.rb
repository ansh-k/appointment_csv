class CsvService

  def self.create
    clients = {}
    Client.all.each do |client|
      client.appointments.each do |app|
        clients[client.id] = [] unless clients[client.id]
        clients[client.id] << app.location
      end
    end
    self.to_csv(clients)
  end

  def self.to_csv(clients)
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes

      clients.each do |key, value|
        client = Client.find(key)

        value.flatten.uniq.each_with_index do |loc, index|
          csv << [loc.location_fields, client.client_fields, loc.slots.with_referrer.count, loc.slots.without_referrer.count, client.appointments.active_appointments.count, client.appointments.canceled_appointments.count, client.appointments.active_appointments_price, client.appointments.canceled_appointments_price].flatten
        end
      end

    end
  end

  def self.csv_attributes
    %w{location_id location_full_address variation_names client_id client_full_name client_phone client_email bookings_with_referrer bookings_without_referrer active_bookings_no canceled_bookings_no price_for_canceled price_for_active}
  end
end