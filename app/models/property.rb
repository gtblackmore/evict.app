class Property < ApplicationRecord
  belongs_to :entity
  has_many :tenants, dependent: :destroy
  validates :address, :city, :state, :zip, :county, presence: true
end
