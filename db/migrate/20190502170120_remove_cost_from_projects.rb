class RemoveCostFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :cost, :decimal
  end
end
