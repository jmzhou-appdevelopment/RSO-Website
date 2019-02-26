# == Schema Information
#
# Table name: attendances
#
#  id         :integer          not null, primary key
#  student_id :integer
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Attendance < ApplicationRecord
    belongs_to :event
    belongs_to :student
    validates :student_id, uniqueness: { scope: :event_id,
    message: "is already attending." }
end
