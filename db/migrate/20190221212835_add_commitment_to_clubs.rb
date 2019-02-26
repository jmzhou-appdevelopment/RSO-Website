class AddCommitmentToClubs < ActiveRecord::Migration[5.1]
  def change
    add_column :clubs, :commitment, :text
  end
end
