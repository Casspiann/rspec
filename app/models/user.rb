class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :email, presence: true, uniqueness: { case_sensitive: false }
         validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
         validates :password,
                   length: { minimum: 6 },
                   if: -> { new_record? || !password.nil? }

  def self.ransackable_attributes(auth_object = nil)
  ["created_at", "email", "encrypted_password", "id", "id_value", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end
end