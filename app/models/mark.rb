class Mark < ApplicationRecord
  belongs_to :lab_report
  validates :points, presence: true, inclusion: { in: 0..100 }
end
