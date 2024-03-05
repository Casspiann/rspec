class Api::V1::EmployeesController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token, if: -> { request.format.json? }


  def index
    @employees = Employee.all
    render json: @employees, status:200
  end

  def create
    @employee = Employee.new(employee_params)  
    if @employee.save
      render json: @employee, status: 200
    else
      render json: { error: "Internal server Problem" }
    end
  end


  def update
  end

  def destroy
    @employee = Employee.find_by(id: params[:id])
    if @employee
      if @employee.destroy
        render json: { message: "User successfully deleted" }, status: :ok
      else
        render json: { error: "Failed to delete user" }, status: :unprocessable_entity
      end
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end

  private

  def set_employee
    @employee = Employee.find_by(id: params[:id])
    render json: { error: "Employee not found" }, status: :not_found unless @employee
  end

  def employee_params
    params.require(:employee).permit(:name, :email, :phoneNo, :address)
  end
end





# class Api::V1::EmployeesController < ApplicationController
#   protect_from_forgery with: :null_session
#   skip_before_action :verify_authenticity_token, if: -> { request.format.json? }

#   def index
#     @employees = Employee.all
#     render json: @employees, status: 200
#   end

#   def create
#     @employee = Employee.new(employee_params)

#     if @employee.save
#       render json: @employee, status: :created
#     else
#       render json: { error: "Internal server problem" }, status: :unprocessable_entity
#     end
#   end

#   def update
#     if @employee.update(employee_params)
#       render json: @employee, status: :ok
#     else
#       render json: { error: "Internal server problem" }, status: :unprocessable_entity
#     end
#   end

#   def destroy
#     if @employee.destroy
#       render json: { message: "Employee successfully deleted" }, status: :ok
#     else
#       render json: { error: "Failed to delete employee" }, status: :unprocessable_entity
#     end
#   end

#   private

#   def set_employee
#     @employee = Employee.find_by(id: params[:id])
#     render json: { error: "Employee not found" }, status: :not_found unless @employee
#   end

#   def employee_params
#     params.require(:employee).permit(:name, :email, :phoneNo, :address)
#   end
# end
