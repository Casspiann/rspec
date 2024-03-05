class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        #  has_secure_password
         validates :email, presence: true, uniqueness: true
         validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
         #validates :username, presence: true, uniqueness: true
         validates :password,
                   length: { minimum: 6 },
                   if: -> { new_record? || !password.nil? }
end
