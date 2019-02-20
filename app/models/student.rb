# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ApplicationRecord
    has_many :enrollments
    has_many :clubs, :through => :enrollments
end
