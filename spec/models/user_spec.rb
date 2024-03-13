require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive  }
    it { should allow_value('user@example.com').for(:email) }
    it { should_not allow_value('userexample.com').for(:email) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'Devise modules' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive  }
    it { should allow_value('user@example.com').for(:email) }
    it { should_not allow_value('userexample.com').for(:email) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe '.ransackable_attributes' do
    it 'returns an array of attribute names' do
      expected_attributes = ["created_at", "email", "encrypted_password", "id", "id_value", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
      expect(User.ransackable_attributes).to eq(expected_attributes)
    end
  end
end