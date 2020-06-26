class Attorney < ApplicationRecord
  has_many :evictions
  

  def full_name
    "#{self.first_name}" + " #{self.last_name}"
  end
end