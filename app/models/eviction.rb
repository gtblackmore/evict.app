class Eviction < ApplicationRecord
  belongs_to :attorney
  belongs_to :property
end