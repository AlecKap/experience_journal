class Group < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :experiences, dependent: :destroy
  
  validates :name, presence: true
end
