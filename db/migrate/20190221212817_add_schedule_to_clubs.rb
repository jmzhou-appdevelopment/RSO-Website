class AddScheduleToClubs < ActiveRecord::Migration[5.1]
  def change
    add_column :clubs, :schedule, :text
  end
end
