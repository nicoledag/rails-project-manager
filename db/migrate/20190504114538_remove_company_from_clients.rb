class RemoveCompanyFromClients < ActiveRecord::Migration[5.2]
  def change
    remove_column :clients, :company, :string
  end
end
