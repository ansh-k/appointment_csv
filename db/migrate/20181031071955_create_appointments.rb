class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.integer :client_id
      t.integer :slot_id
      t.string :status

      t.timestamps
    end
  end
end
