# == Schema Information
#
# Table name: clubs
#
#  id          :integer          not null, primary key
#  title       :text
#  source      :string
#  blurb       :text
#  summary     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  schedule    :text
#  commitment  :text
#  getinvolved :text
#

class Club < ApplicationRecord
    has_many :enrollments
    has_many :students, :through => :enrollments
    has_many :tags
    has_many :categories, :through => :tags
    validates :title, uniqueness: {
        message: "cannot have a name that already exists."
    }
    validates :summary, length: { maximum: 1000 }, allow_blank: true
    validates :schedule, length: { maximum: 1000 },allow_blank: true
    validates :commitment, length: { maximum: 1000 },allow_blank: true
    validates :getinvolved, length: { maximum: 1000 },allow_blank: true
end
