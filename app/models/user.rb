class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        #  VALID_PASSWORD_REGEX =/\A[a-z0-9]+\z/i
        #  validates :password, presence: true,length:{minimum:6}, format: { with: VALID_PASSWORD_REGEX }
        #  validates :nickname, presence: true, lendth:{maximum: 6 }
        #  validates :email,presence:true,uniqueness: true, confirmation: true

  
end

