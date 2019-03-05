# == Schema Information
#
# Table name: enrollments
#
#  id         :integer          not null, primary key
#  club_id    :integer
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Enrollment < ApplicationRecord
    belongs_to :club
    belongs_to :user
    validates :user_id, uniqueness: { scope: :club_id,
    message: "is already enrolled." }
end
