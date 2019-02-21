class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :tables, through: :reservations

  validates :login, presence: true, uniqueness: true, length: { minimum: 5, maximum: 15 }

  validates :name, presence: true, length: { minimum: 3, maximum: 30 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  has_secure_password
  
  validates :password, presence: true, length: { minimum: 8 }

  
end
