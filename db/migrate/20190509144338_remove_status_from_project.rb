class RemoveStatusFromProject < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :status, :integer, :default => 0
  end
end
