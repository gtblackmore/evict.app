class RemoveEntityFromProperties < ActiveRecord::Migration[6.0]
  def change
    remove_column :properties, :entity_id, :string
  end
end
