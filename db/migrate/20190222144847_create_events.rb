class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :club_id
      t.text :blurb
      t.datetime :time
      t.string :location

      t.timestamps
    end
  end
end
