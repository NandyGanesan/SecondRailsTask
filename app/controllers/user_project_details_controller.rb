class UserProjectDetailsController < ApplicationController
  def new
    @user_project_detail = UserProjectDetail.new
    @project = Project.all
    @user = User.all
  end

  def create
    #render plain: params[:tag].inspect
    @user_project_detail = UserProjectDetail.new(userprojectdetail_params)
    if(@user_project_detail.save)
      redirect_to departments_mainpage_path, notice: 'Particular user assigned Particular project created successfully.'
    else
      render 'new'
    end
  end

  private def userprojectdetail_params
    params.require(:userprojectdetail).permit(:project_id,:user_id)
  end
end
