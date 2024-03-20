class User < ApplicationRecord
  has_many :experiences, dependent: :destroy

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable, :recoverable
  devise :database_authenticatable,
         :validatable,
         :rememberable,
         :registerable
        #  :confirmable
        


  def name
    email.split('@').first.capitalize
  end
end
