class ProjectsController < ApplicationController

  def index
    @projects = current_user.projects
  end


  def new
        # raise params.inspect
    if (params[:client_id]) &&  @client = Client.find_by_id(params[:client_id])
      @project = @client.projects.build
    else
      @project = Project.new
    end
  end


  def create
    # raise params.inspect

   # if @project.save

    if (params[:client_id])
      @client = Client.find(params[:client_id])
      @project = @client.projects.create(project_params)
      @project.user_id = current_user.id
      @project.save

      redirect_to client_project_path(@client, @project)
    elsif
      @client = Client.find(params[:project][:client_id])
      @project = @client.projects.create(project_params)
      @project.user_id = current_user.id
      @project.save

      redirect_to client_project_path(@client, @project)

    else
      render :new  #lets us call field w/errors.  Keeps inputted data.  #renders users/new form.
    end
  end

  def show
    # raise params.inspect
    set_project
  end

  def edit
    # raise params.inspect
    set_project
  end

  def update
    set_project
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render :edit #allows for field with errors.
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
      params.require(:project).permit(:name, :description)
    end


end
