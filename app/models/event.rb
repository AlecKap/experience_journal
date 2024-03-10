class Event < ApplicationRecord
  belongs_to :entry_date

  validates :title, presence: true

  scope :ordered, -> { order(id: :desc) }
end
