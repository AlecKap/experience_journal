class User < ApplicationRecord
  has_many :experiences, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :validatable, :rememberable, :registerable
        #  :recoverable


  def name
    email.split('@').first.capitalize
  end
end
