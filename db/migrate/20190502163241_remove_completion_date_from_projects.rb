class RemoveCompletionDateFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :completion_date, :date
  end
end
