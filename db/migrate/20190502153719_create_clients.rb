class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :company

      t.timestamps
    end
  end
end
