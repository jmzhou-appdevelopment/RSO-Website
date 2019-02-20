class CreateClubs < ActiveRecord::Migration[5.1]
  def change
    create_table :clubs do |t|
      t.text :title
      t.string :source
      t.text :blurb
      t.text :summary

      t.timestamps
    end
  end
end
