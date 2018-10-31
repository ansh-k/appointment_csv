class CreateSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :slots do |t|
      t.integer :location_id
      t.datetime :begin_at
      t.datetime :end_at
      t.integer :purchase_id

      t.timestamps
    end
  end
end
