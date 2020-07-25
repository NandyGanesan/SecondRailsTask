class DepartmentsController < ApplicationController

  def mainpage
  end

  def index
    @department = Department.all
  end

  def new
    @department = Department.new
  end

  def create
    #render plain: params[:tag].inspect
    @department = Department.new(department_params)
    if(@department.save)
      redirect_to @department, notice: 'New department created successfully.'
    else
      render 'new'
    end
  end

  def show
    @department = Department.find(params[:id])
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find_by(params[:id])
      if(@department.update(department_params))
        redirect_to @department, notice: 'Department updated successfully.'
      else
        render 'edit'
      end
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    redirect_to departments_path,  notice: 'Department deleted successfully.'
  end

  private def department_params
      params.require(:department).permit(:departmentname)
  end
end
