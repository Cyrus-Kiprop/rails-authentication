class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_many :posts, dependent: :destroy

  validates :fname, presence: true
  validates :lname, presence: true
  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
