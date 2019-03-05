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
end
