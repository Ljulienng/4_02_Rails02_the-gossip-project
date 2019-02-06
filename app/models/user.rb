class User < ApplicationRecord
  has_many :written_gossips, foreign_key: 'author_id', class_name: "Gossip"
  has_many :comments
  has_many :undercomments
  has_many :likes
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :private_message_recipients
  has_many :received_messages, through: :private_message_recipients, class_name: "PrivateMessage"
  belongs_to :city
end