class CreateEvictions < ActiveRecord::Migration[6.0]
  def change
    create_table :evictions do |t|
      t.integer :outstanding_balance
      t.string  :notice_date
      t.belongs_to :property
      t.belongs_to :attorney
    end
  end
end
