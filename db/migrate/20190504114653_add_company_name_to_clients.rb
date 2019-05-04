class AddCompanyNameToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :company_name, :string
  end
end
