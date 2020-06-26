class Tenant < ApplicationRecord
  belongs_to :property
  belongs_to :user
  has_many :evictions
  validates :first_name, :last_name, :email, :phone, presence: true
  validates :email, uniqueness: true

  def self.delinquencies
    where("outstanding_balance > 0")
  end

  def self.total_owed
    sum("outstanding_balance")
  end

  def full_name
    "#{self.first_name}" + " #{self.last_name}"
  end
end
