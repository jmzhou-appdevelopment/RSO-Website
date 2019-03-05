# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  firstname              :string
#  lastname               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :enrollments
  has_many :clubs, :through => :enrollments
  has_many :favorites
  has_many :favoriteclubs, :through => :favorites, :source => :club
  has_many :friend_request_list_where_inviter, :class_name => "Friend" , :foreign_key => "inviter_id"
  has_many :friend_requests_where_inviter, :through => :friend_request_list_where_inviter , :source => :invitee
  has_many :friend_request_list_where_invitee, :class_name => "Friend" , :foreign_key => "invitee_id"
  has_many :friend_requests_where_invitee, :through => :friend_request_list_where_invitee , :source => :inviter
end
