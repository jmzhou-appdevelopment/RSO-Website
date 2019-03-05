class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.integer :inviter_id
      t.integer :invitee_id
      t.integer :status

      t.timestamps
    end
  end
end
