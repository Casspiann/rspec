require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe '#authenticate_user' do
    context 'with valid authentication token' do
      let!(:user) { create(:user, authentication_token: 'valid_token') }

      it 'sets current_user' do
        request.headers['Authorization'] = 'Bearer valid_token'
        controller.authenticate_user
        expect(controller.current_user).to eq(user)
      end
    end

    context 'with invalid authentication token' do
      it 'does not set current_user' do
        request.headers['Authorization'] = 'Bearer invalid_token'
        controller.authenticate_user
        expect(controller.current_user).to be_nil
      end
    end
  end

  describe '#not_found' do
    it 'renders not_found error with status 404' do
      get :not_found
      expect(response).to have_http_status(:not_found)
      expect(response.body).to eq({ error: 'not_found' }.to_json)
    end
  end

  describe '#authorize_request' do
    context 'with valid authentication token' do
      let!(:user) { create(:user, authentication_token: 'valid_token') }

      it 'sets current_user' do
        request.headers['Authorization'] = 'Bearer valid_token'
        controller.authorize_request
        expect(controller.current_user).to eq(user)
      end
    end

    context 'with invalid authentication token' do
      it 'returns unauthorized status' do
        request.headers['Authorization'] = 'Bearer invalid_token'
        controller.authorize_request
        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)).to eq({ 'errors' => 'Signature has expired' })
      end
    end
  end
end
