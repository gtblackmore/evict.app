class User < ApplicationRecord
  has_secure_password
  has_many :properties, dependent: :destroy
  has_many :tenants, through: :properties
  validates :email, :password_digest, presence: true
  validates_uniqueness_of :email

  def self.find_or_create_by_omniauth(auth)
    where(email: auth.email).first_or_create do |user|
      user.email = auth.email
      user.password = SecureRandom.hex
    end
  end

end
