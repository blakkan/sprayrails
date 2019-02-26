class Kv < ApplicationRecord
  validates :key, uniqueness: true
end
