require 'rails_helper'

RSpec.describe Api::V1::EmployeesController, type: :controller do
  describe "GET #index" do
    it "returns a list of employees" do
      employees = create_list(:employee, 3)
      get :index, format: :json
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new employee" do
        expect {
          post :create, params: { employee: attributes_for(:employee) }, format: :json
        }.to change(Employee, :count).by(1)
      end

      it "returns a created response" do
        post :create, params: { employee: attributes_for(:employee) }, format: :json
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      it "does not create a new employee" do
        expect {
          post :create, params: { employee: { name: nil } }, format: :json
        }.not_to change(Employee, :count)
      end

      it "returns an unprocessable entity response" do
        post :create, params: { employee: { name: nil } }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:employee) { create(:employee) }

    it "destroys the requested employee" do
      expect {
        delete :destroy, params: { id: employee.id }, format: :json
      }.to change(Employee, :count).by(-1)
    end

    it "returns a success response" do
      delete :destroy, params: { id: employee.id }, format: :json
      expect(response).to have_http_status(:ok)
    end

    it "returns not found if employee does not exist" do
      delete :destroy, params: { id: 'non_existent_id' }, format: :json
      expect(response).to have_http_status(:not_found)
    end
  end
end
