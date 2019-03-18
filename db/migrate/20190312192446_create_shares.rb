class CreateShares < ActiveRecord::Migration[5.1]
  def change
    create_table :shares do |t|
      t.integer :sharer_id
      t.integer :sharee_id
      t.string :share_type
      t.integer :shared_item_id

      t.timestamps
    end
  end
end
