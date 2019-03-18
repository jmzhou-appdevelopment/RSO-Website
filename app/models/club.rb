# == Schema Information
#
# Table name: clubs
#
#  id            :integer          not null, primary key
#  title         :text
#  source        :string
#  blurb         :text
#  summary       :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  schedule      :text
#  commitment    :text
#  getinvolved   :text
#  admin_user_id :integer
#

class Club < ApplicationRecord
    has_many :enrollments
    has_many :users, :through => :enrollments
    has_many :tags
    has_many :events
    has_many :categories, :through => :tags
    validates :title, uniqueness: {
        message: "cannot have a name that already exists."
    }
    validates :title, length: { maximum: 20 }, presence: true
    validates :blurb, length: { maximum: 30 },presence: true
    
    has_many :favorites
    has_many :fans, :through => :favorites, :source => :user
    
    validates :summary, length: { maximum: 1000 }, presence: true
    validates :schedule, length: { maximum: 1000 }, presence: true
    validates :commitment, length: { maximum: 1000 }, presence: true
    validates :getinvolved, length: { maximum: 1000 }, presence: true
end
