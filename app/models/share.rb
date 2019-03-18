# == Schema Information
#
# Table name: shares
#
#  id             :integer          not null, primary key
#  sharer_id      :integer
#  sharee_id      :integer
#  share_type     :string
#  shared_item_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Share < ApplicationRecord
end
