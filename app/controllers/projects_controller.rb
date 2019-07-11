class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects
    # render json: @projects, status:200
  end

  def new
    if (params[:client_id]) && @client = Client.find_by_id(params[:client_id])
      @project = @client.projects.build #adds client id to project.
    else
      @project = Project.new
    end
  end

  def create
    @project = current_user.projects.build(project_params)
      if @project.save
        redirect_to client_project_path(@project.client, @project)
      else
        render :new  #does not send a new get request.  lets us call field w/errors.  Keeps inputted data.  #renders users/new form.
      end
  end

  def show

    # respond_to do |format|
    #   format.html { render :show}
    #   format.json { render json: @project.to_json(only: [:name, :description, :id]) }
    # end
  end

  def edit

  end

  def update
    if project_user_equals_current_user && @project.update(project_params)
      redirect_to project_path(@project)
    else
      render :edit #allows for field with errors.
    end
  end

  def destroy
    # raise params.inspect
    if project_user_equals_current_user
      # @project.comments.destroy_all   #destroy comments associated with project.
      @project.destroy
      redirect_to projects_path
    end
  end

  private

  def set_project
    @project = Project.find_by(id: params[:id])
    if !@project
      redirect_to projects_path
    end
  end


  def project_params
    params.require(:project).permit(:name, :description, :target_completion_date, :completion_date, :client_id)
  end


end
