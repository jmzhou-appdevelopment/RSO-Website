# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  club_id    :integer
#  source     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Photo < ApplicationRecord
end
