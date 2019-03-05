class AddUserIdToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :user_id, :integer
    remove_column :favorites, :student_id
  end
end
