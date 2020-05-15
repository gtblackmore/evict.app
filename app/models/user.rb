class User < ApplicationRecord
  has_secure_password
  has_many :entities
  has_many :properties, through: :entities
  has_many :tenants, through: :properties
  validates_uniqueness_of :email
end
