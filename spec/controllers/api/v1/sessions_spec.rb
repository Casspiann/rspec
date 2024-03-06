# # spec/controllers/api/v1/sessions_controller_spec.rb

# require 'rails_helper'

# RSpec.describe Api::V1::SessionsController, type: :controller do
#   describe 'POST #create' do
#     context 'with valid credentials' do
#       let(:valid_params) { { email: 'test@example.com', password: 'password123' } }
#       let!(:user) { create(:user, email: 'test@example.com', password: 'password123') }

#       it 'returns a token' do
#         post :create, params: valid_params
#         expect(response).to have_http_status(:ok)
#         expect(JSON.parse(response.body)).to have_key('token')
#       end
#     end

#     context 'with invalid credentials' do
#       let(:invalid_params) { { email: 'invalid@example.com', password: 'invalidpassword' } }

#       it 'returns unauthorized' do
#         post :create, params: invalid_params
#         expect(response).to have_http_status(:unauthorized)
#         expect(JSON.parse(response.body)).to have_key('error')
#       end
#     end
#   end

#   describe 'DELETE #destroy' do
#   context 'when user is authenticated' do
#     let(:user) { create(:user) }

#     before do
#       allow(controller).to receive(:current_user).and_return(user)
#     end

#     it 'logs out the user' do
#       delete :destroy
#       expect(response).to have_http_status(:ok)
#       expect(JSON.parse(response.body)).to include('message' => 'Logged out successfully')
#     end
#   end

#   context 'when user is not authenticated' do
#     it 'returns unauthorized' do
#       delete :destroy
#       expect(response).to have_http_status(:unauthorized)
#       expect(JSON.parse(response.body)).to include('error')
#     end
#   end
# end

# end
# spec/controllers/api/v1/sessions_controller_spec.rb
require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do
  describe 'POST #create' do
    context 'with valid credentials' do
      let!(:user) { create(:user, email: 'test@example.com', password: 'password123') }
      let(:valid_params) { { email: 'test@example.com', password: 'password123' } }

      it 'returns a token' do
        post :create, params: valid_params
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to have_key('token')
      end
    end

    context 'with invalid credentials' do
      let(:invalid_params) { { email: 'invalid@example.com', password: 'invalidpassword' } }

      it 'returns unauthorized' do
        post :create, params: invalid_params
        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)).to have_key('error')
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when user is authenticated' do
      #debugger
      let(:user) { create(:user) }

      # before do
      #   allow(controller).to receive(:current_user).and_return(user)
      # end

      it 'logs out the user' do
        delete :destroy
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to include('message' => 'Logged out successfully')
      end
    end

    context 'when user is not authenticated' do
      it 'returns unauthorized' do
        delete :destroy
        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)).to have_key('error')
      end
    end
  end
end
