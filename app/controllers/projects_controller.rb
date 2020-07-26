class ProjectsController < ApplicationController
    def index
      @project = Project.all
    end

    def new
      @project = Project.new
      @department = Department.all
    end

    def create
      #render plain: params[:tag].inspect
      @project = Project.new(project_params)
      if(@project.save)
        redirect_to @project, notice: 'New User created successfully.'
      else
        render 'new'
      end
    end

    def show
      @project = Project.find(params[:id])
      @department = Department.find_by(:id => @project.department_id)
      @user = UserProjectDetail.where(project_id: @project.id).pluck(:user_id)
      @users = User.where(:id => @user).select('id,name,gender')
    end

    def edit
      @project = Project.find(params[:id])
      @department = Department.all
  end

    def update
      @project = Project.find_by(params[:id])
        if(@project.update(project_params))
          redirect_to @project, notice: 'User Detail updated successfully.'
        else
          render 'edit'
        end
    end

    def destroy
      @project = Project.find(params[:id])
      @project.destroy
      redirect_to projects_path,  notice: 'User Detail deleted successfully.'
    end

  private def project_params
    params.require(:project).permit(:projectname)
  end
end
