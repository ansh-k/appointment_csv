class CreateSlotVariations < ActiveRecord::Migration[5.2]
  def change
    create_table :slot_variations do |t|
      t.integer :slot_id
      t.integer :variation_id
      t.float :price
    end
  end
end
