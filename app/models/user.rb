class User < ApplicationRecord
	# validates :first_name, presence: true
	# validates :last_name, presence: true
	# validates :email,
 #    presence: true,
 #    uniqueness: true,
 #    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
 #  validates :password, presence: true, length: { minimum: 6 }
 #  validates :age, presence: true



  has_many :written_gossips, foreign_key: 'author_id', class_name: "Gossip"
  has_many :written_comments, foreign_key: 'author_id', class_name: "Comment"
  has_many :written_undercomments, foreign_key: 'author_id', class_name: "Undercomment"
  has_many :sent_likes, foreign_key: 'author_id', class_name: "Like"
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :private_message_recipients
  has_many :received_messages, through: :private_message_recipients, class_name: "PrivateMessage"
  belongs_to :city
  has_secure_password
end