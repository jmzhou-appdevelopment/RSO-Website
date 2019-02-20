# == Schema Information
#
# Table name: tags
#
#  id          :integer          not null, primary key
#  club_id     :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Tag < ApplicationRecord
    belongs_to :club
    belongs_to :category
    validates :club_id, uniqueness: { scope: :category_id,
    message: "is already tagged in this category." }
end
