class EmployeesController < ApplicationController

  def index
    @employees = Employee.paginate(:page => params[:page], :per_page=>5)
    render component: 'Employees', props: { employees: @employees }
  end

  def create
    @employee = Employee.new(employee_params)
    respond_to do |format|
      format.json do 
        if @employee.save
          render :json => @employee
        else
          render :json => { :errors => @employee.errors.messages }, :status => 422
        end
      end
    end
  end

  def update
    @employee = Employee.find(params[:id])
    respond_to do |format|
      format.json do 
        if @employee.update(employee_params)
          render :json => @employee
        else
          render :json => { :errors => @employee.errors.messages }, :status => 422
        end
      end
    end
  end

  def destroy
    Employee.find(params[:id]).destroy
    respond_to do |format|
      format.json { render :json => {}, :status => :no_content }
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :address, :phone, :date_of_birth, :image)
  end
end