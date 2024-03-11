class Event < ApplicationRecord
  belongs_to :entry_date
  has_one :description, dependent: :destroy

  validates :title, presence: true

  scope :ordered, -> { order(id: :desc) }
end
