# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string
#  year        :string
#  duration    :integer
#  description :text
#  image_url   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#

class Movie < ApplicationRecord
    validates :title, :director_id, presence: true
    validates :year, numericality: {
        only_integer: true, 
        greater_than_or_equal_to: 1870,
        less_than_or_equal_to:2050
    }
    validates :title, uniqueness: { 
        scope: :year,
    message: "should be unique with respect to year" 
    }
    validates :duration, numericality: {
        only_integer: true, 
        greater_than_or_equal_to: 0,
        less_than_or_equal_to:2764800,
        allow_blank: true
    }
    belongs_to :director
    has_many :characters
    has_many :actors, :through => :characters
end
