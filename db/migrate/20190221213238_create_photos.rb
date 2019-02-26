class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.integer :club_id
      t.string :source

      t.timestamps
    end
  end
end
