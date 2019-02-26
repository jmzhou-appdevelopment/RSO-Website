class AddGetinvolvedToClubs < ActiveRecord::Migration[5.1]
  def change
    add_column :clubs, :getinvolved, :text
  end
end
