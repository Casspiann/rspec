class Employee < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phoneNo, presence: true
    validates :address, presence: true

    def self.ransackable_attributes(auth_object = nil)
      ["address", "created_at", "email", "id", "id_value", "name", "phoneNo", "updated_at"]
    end
  end