class UserProjectDetailsController < ApplicationController
  def new
    @user_project_detail = UserProjectDetail.new
    @project = Project.all
    @user = User.all
  end

  def create
    #render plain: params[:userprojectdetail].inspect
    @user_project_detail = UserProjectDetail.new(userprojectdetail_params)
    if(@user_project_detail.save)
      redirect_to departments_mainpage_path, notice: 'Particular user assigned Particular project successfully.'
    else
      render 'new'
    end
  end

  def destroy
    @user_id = User.find(params[:user_id])
    @project_id = Project.find(params[:project_id])
    UserProjectDetail.where(:user_id => @user_id).where(:project_id => @project_id).destroy
  end

  private def userprojectdetail_params
    params.require(:user_project_detail).permit(:project_id,:user_id)
  end
end
