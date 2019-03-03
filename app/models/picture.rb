class Picture < ApplicationRecord
  has_one_attached :snapshot
end
