class Tenant < ApplicationRecord
  belongs_to :property
  validates :first_name, :last_name, :email, :phone, presence: true
  validates :email, uniqueness: true
end
