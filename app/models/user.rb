class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :comments
  has_many :undercomments
  has_many :likes
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :private_message_recipients
  has_many :received_messages, through: :private_message_recipients, class_name: "PrivateMessage"
end
