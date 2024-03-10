class Experience < ApplicationRecord
  belongs_to :group
  has_many :entry_dates, dependent: :destroy
  
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  broadcasts_to -> (experience) { [experience.group, "experiences"] }, inserts_by: :prepend
  # Line 6 is equivalent to:
    # after_create_commit -> { broadcast_prepend_later_to "experiences" }
    # the above is equivalent to:
    # after_create_commit -> { broadcast_prepend_to "experiences", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }
    
    # after_update_commit -> { broadcast_replace_later_to "experiences" }
    # after_destroy_commit -> { broadcast_remove_to "experiences" }
end
