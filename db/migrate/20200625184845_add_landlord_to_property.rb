class AddLandlordToProperty < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :landlord, :string
  end
end
