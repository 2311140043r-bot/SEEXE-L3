class Task < ApplicationRecord
  # バリデーション（最低限）
  validates :title, presence: true, length: { maximum: 100 }
  validates :priority, numericality: { only_integer: true, allow_nil: true }
end
