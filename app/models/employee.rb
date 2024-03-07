class Employee < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phoneNo, presence: true
    validates :address, presence: true
  end