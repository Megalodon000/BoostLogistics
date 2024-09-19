class CreateAdminTrackings < ActiveRecord::Migration[7.1]
  def change
    create_table :trackings do |t|
      t.string :status
      t.string :location
      t.text :notes
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
