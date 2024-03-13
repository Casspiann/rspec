# spec/models/employee_spec.rb
require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phoneNo) }
    it { should validate_presence_of(:address) }

    it 'validates the format of email' do
      employee = build(:employee, email: 'invalid_email')
      expect(employee).not_to be_valid
      expect(employee.errors[:email]).to include('is invalid')
    end

    it 'allows valid email format' do
      employee = build(:employee, email: 'valid@example.com', name: 'John Doe', phoneNo: '1234567890', address: '123 Street')
      expect(employee).to be_valid
    end
  end

  describe '.ransackable_attributes' do
    it 'returns an array of attribute names' do
      expected_attributes = ["address", "created_at", "email", "id", "id_value", "name", "phoneNo", "updated_at"]
      expect(Employee.ransackable_attributes).to eq(expected_attributes)
    end
  end
end
