class AddingIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :clients, :id
    add_index :appointments, :status
    add_index :purchases, :referrer
    add_index :variations, :name
    add_index :slot_variations, :price
  end
end
