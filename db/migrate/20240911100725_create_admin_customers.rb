class CreateAdminCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.string :company_type
      t.string :additional_address
      t.string :city
      t.string :postal_code
      t.string :country
      t.string :legal_identifier_type
      t.string :shipment_reference
      t.string :email
      t.boolean :approved

      t.timestamps
    end
  end
end
