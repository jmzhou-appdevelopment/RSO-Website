class AddUserIdToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :user_id, :integer
    remove_column :attendances, :student_id
  end
end
