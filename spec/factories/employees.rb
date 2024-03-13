# Employee factory
FactoryBot.define do
  factory :employee do
    name { "John Doe" }
    email { "john@example.com" }
    phoneNo { "1234567890" }  # Changed phoneno to match the controller
    address { "123 Main St" }
  end
end

# EmployeesController
def employee_params
  params.require(:employee).permit(:name, :email, :phoneNo, :address)  # Changed phoneNo to phoneno
end
