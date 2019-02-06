class Comment < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :gossip
  has_many :undercomments
  has_many :likes
end
