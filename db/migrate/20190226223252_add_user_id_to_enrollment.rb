class AddUserIdToEnrollment < ActiveRecord::Migration[5.1]
  def change
    add_column :enrollments, :user_id, :integer
    remove_column :enrollments, :student_id
  end
end