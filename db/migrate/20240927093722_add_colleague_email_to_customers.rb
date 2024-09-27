class AddColleagueEmailToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :colleague_email, :string
  end
end
