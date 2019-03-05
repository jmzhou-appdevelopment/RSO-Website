# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  club_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Favorite < ApplicationRecord
  
  belongs_to :club
  belongs_to :user
end
