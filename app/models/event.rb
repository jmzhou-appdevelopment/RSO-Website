# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  club_id     :integer
#  blurb       :text
#  time        :datetime
#  location    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#

class Event < ApplicationRecord
    belongs_to :club
    has_many :attendances
    has_many :users, :through => :attendances
    has_many :shares
    validates :title, uniqueness: {
        message: "cannot have a name that already exists."
    }
    validates :title, presence: true
    validates :blurb, presence: true
    validates :blurb, length: { maximum: 30 }
    validates :description, presence: true
    validates :time, presence: true
    validates :location, presence: true
    
end
