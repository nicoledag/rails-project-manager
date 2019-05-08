class AddTargetCompletionDateToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :target_completion_date, :date
  end
end
