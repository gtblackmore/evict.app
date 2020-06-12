class Property < ApplicationRecord
  belongs_to :entity
  has_many :tenants, dependent: :destroy
  validates :address, :city, :state, :zip, :county, presence: true
 
  def occupied?
    !self.tenants.empty?
  end
  
  def total_owed
    self.tenants.delinquencies.sum("outstanding_balance")
  end
end
