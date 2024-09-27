class AddBusinessTypeToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :business_type, :string
  end
end
