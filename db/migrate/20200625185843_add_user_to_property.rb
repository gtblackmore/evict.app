class AddUserToProperty < ActiveRecord::Migration[6.0]
  def change
    add_reference :properties, :user, null: false
  end
end
