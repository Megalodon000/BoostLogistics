class CreateAdminBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.string :origin
      t.string :destination
      t.date :shipment_date
      t.string :shipment_type
      t.float :weight
      t.float :length
      t.float :width
      t.float :height
      t.text :special_instructions
      t.string :status
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
