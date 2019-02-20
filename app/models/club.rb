# == Schema Information
#
# Table name: clubs
#
#  id         :integer          not null, primary key
#  title      :text
#  source     :string
#  blurb      :text
#  summary    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Club < ApplicationRecord
    has_many :enrollments
    has_many :students, :through => :enrollments
    has_many :tags
    has_many :categories, :through => :tags
end
