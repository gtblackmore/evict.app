class Property < ApplicationRecord
  belongs_to :user
  has_many :tenants, dependent: :destroy
  validates :address, :city, :state, :zip, :county, :landlord, presence: true
 
  def occupied?
    !self.tenants.empty?
  end
  
  def total_owed
    self.tenants.delinquencies.sum("outstanding_balance")
  end

  def mailing_address
    "#{self.address}, " + "#{self.city}, " + "#{self.state} " + " #{self.zip}"
  end
  
end
