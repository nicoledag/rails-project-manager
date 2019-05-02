class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.date :target_completion_date
      t.date :completion_date
      t.boolean :status, default: true
      t.decimal :cost
      t.integer :client_id
      t.integer :user_id

      t.timestamps
    end
  end
end
