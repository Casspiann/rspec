FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    password { "password123" }
    encrypted_password { Devise::Encryptor.digest(User, password) }
    reset_password_token { nil }
    reset_password_sent_at { nil }
    remember_created_at { nil }
  end
end