class EventDate < ApplicationRecord
  belongs_to :experience

  validates :date, presence: true, uniqueness: { scope: :experience_id }

  scope :ordered, -> { order(date: :asc) }
end
