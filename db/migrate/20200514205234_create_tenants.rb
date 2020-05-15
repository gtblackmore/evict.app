class CreateTenants < ActiveRecord::Migration[6.0]
  def change
    create_table :tenants do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.boolean :past_due
      t.integer :outstanding_balance
      t.belongs_to :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
