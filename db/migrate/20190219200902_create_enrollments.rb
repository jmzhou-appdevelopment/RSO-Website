class CreateEnrollments < ActiveRecord::Migration[5.1]
  def change
    create_table :enrollments do |t|
      t.integer :club_id
      t.integer :student_id
      t.string :type

      t.timestamps
    end
  end
end
