class UsersController < ApplicationController
  def index
    @user = User.all
    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  def new
    @user = User.new
    @department = Department.all
  end

  def create
    #render plain: params[:tag].inspect
    @user = User.new(user_params)
    if(@user.save)
      redirect_to @user, notice: 'New User created successfully.'
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @department = Department.find_by(:id => @user.department_id)
    @project = UserProjectDetail.where(user_id: @user.id).pluck(:project_id)
    @projects = Project.where(:id => @project).select('id,projectname,title')
  end

  def edit
    @user = User.find(params[:id])
    @department = Department.all
end

  def update
    @user = User.find_by(params[:id])
      if(@user.update(user_params))
        redirect_to @user, notice: 'User Detail updated successfully.'
      else
        render 'edit'
      end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path,  notice: 'User Detail deleted successfully.'
  end

  private def user_params
      params.require(:user).permit(:name,:gender,:department_id)
  end
end
