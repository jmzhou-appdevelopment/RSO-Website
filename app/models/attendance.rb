# == Schema Information
#
# Table name: attendances
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Attendance < ApplicationRecord
    belongs_to :event
    belongs_to :user
    validates :user_id, uniqueness: { scope: :event_id,
    message: "is already attending." }
end
