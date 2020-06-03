class CreateEntities < ActiveRecord::Migration[6.0]
  def change
    create_table :entities do |t|
      t.string :legal_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :entity_type
      t.string :phone
      t.string :email
      t.integer :user_id

      t.timestamps
    end
  end
end
