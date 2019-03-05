class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :club_id
      t.integer :student_id

      t.timestamps
    end
  end
end
