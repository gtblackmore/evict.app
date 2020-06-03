class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :county
      t.integer :rent
      t.integer :entity_id
      t.timestamps
    end
  end
end
