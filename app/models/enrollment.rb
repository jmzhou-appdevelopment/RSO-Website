# == Schema Information
#
# Table name: enrollments
#
#  id         :integer          not null, primary key
#  club_id    :integer
#  student_id :integer
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Enrollment < ApplicationRecord
    belongs_to :club
    belongs_to :student
    validates :student_id, uniqueness: { scope: :club_id,
    message: "is already enrolled." }
end
