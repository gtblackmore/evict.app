class Property < ApplicationRecord
  belongs_to :entity
  has_many :tenants, dependent: :destroy
end
