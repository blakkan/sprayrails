class Dose < ApplicationRecord
  validates :species, uniqueness: true
end
