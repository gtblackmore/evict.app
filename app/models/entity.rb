class Entity < ApplicationRecord
  belongs_to :user
  has_many :properties, dependent: :destroy
  has_many :tenants, through: :properties
  validates :legal_name, :address, :city, :state, :zip, :entity_type, :phone, :email, presence: true
end