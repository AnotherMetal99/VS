class LabReport < ApplicationRecord
  has_one :mark
  validates :title, presence: true, length: { maximum: 250 }
  validates :description, presence: true, length: { maximum: 500 }
end
