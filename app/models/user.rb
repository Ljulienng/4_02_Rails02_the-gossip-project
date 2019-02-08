class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
    presence: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "adress please" }
  validates :password, presence: true
  validates :age, presence: true

  has_many :written_gossips, foreign_key: 'author_id', class_name: "Gossip"
  has_many :written_comments, foreign_key: 'author_id', class_name: "Comment"
  has_many :written_undercomments, foreign_key: 'author_id', class_name: "Undercomment"
  has_many :sent_likes, foreign_key: 'author_id', class_name: "Like"
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :private_message_recipients
  has_many :received_messages, through: :private_message_recipients, class_name: "PrivateMessage"
  belongs_to :city, optional: true
  has_secure_password

  class << self
    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Paswword.create(string, cost: cost)
    end

    def User.new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end 

  def authenticated?(remmember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end


end