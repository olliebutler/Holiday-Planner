class Group < ApplicationRecord
  has_many :user_groups, dependent: :destroy
  has_many :users, :through => :user_groups
  has_many :invites
  has_many :unavailabilities
  has_many :comments
  mount_uploader :pic, GroupPicUploader
end
