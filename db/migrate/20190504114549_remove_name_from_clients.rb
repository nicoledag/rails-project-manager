class RemoveNameFromClients < ActiveRecord::Migration[5.2]
  def change
    remove_column :clients, :name, :string
  end
end
