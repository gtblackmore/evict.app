class User < ApplicationRecord
  has_secure_password
  has_many :properties
  has_many :tenants, through: :properties
  validates :email, :password_digest, presence: true
  validates_uniqueness_of :email
end
