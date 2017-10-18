class Comment < ApplicationRecord
  belongs_to :group
  acts_as_votable
end
