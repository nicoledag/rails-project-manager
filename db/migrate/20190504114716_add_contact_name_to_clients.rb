class AddContactNameToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :contact_name, :string
  end
end
