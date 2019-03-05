# == Schema Information
#
# Table name: friends
#
#  id         :integer          not null, primary key
#  inviter_id :integer
#  invitee_id :integer
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Friend < ApplicationRecord

  belongs_to :inviter, :class_name => "User", :foreign_key => "inviter_id"

  belongs_to :invitee, :class_name => "User", :foreign_key => "inviter_id"

validates :inviter, :presence => true, :uniqueness => { :scope => :invitee }
validates :invitee, :presence => true, :uniqueness => { :scope => :inviter }
end
