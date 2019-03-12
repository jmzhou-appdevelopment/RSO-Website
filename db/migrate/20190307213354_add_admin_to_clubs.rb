class AddAdminToClubs < ActiveRecord::Migration[5.1]
  def change
    add_column :clubs, :admin_user_id, :integer
  end
end
