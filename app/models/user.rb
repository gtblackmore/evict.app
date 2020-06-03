class User < ApplicationRecord
  has_secure_password
  has_many :entities, dependent: :destroy
  has_many :properties, through: :entities
  has_many :tenants, through: :properties
  validates :first_name, :last_name, :email, :password_digest, presence: true
  validates_uniqueness_of :email
end
