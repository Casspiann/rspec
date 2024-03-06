class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :email, presence: true, uniqueness: { case_sensitive: false }
         validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
         validates :password,
                   length: { minimum: 6 },
                   if: -> { new_record? || !password.nil? }
end
