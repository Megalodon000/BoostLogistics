class AddCompanyNameToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :company_name, :string
  end
end
