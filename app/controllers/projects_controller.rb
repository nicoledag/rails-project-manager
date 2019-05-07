class ProjectsController < ApplicationController

  def index
    @projects = current_user.projects
    @clients = Client.all
  end

  def new
    # raise params.inspect
    if (params[:client_id]) &&  @client = Client.find_by_id(params[:client_id])
      @project = @client.projects.build #adds client id to project.
      @project.comments.build
    else
      @project = Project.new
      @project.comments.build
    end
  end


  def create
    # raise params.inspect
    if (params[:client_id])  #not able to pass client_id through params.
      @client = Client.find(params[:client_id])
    elsif
      @client = Client.find(params[:project][:client_id])
    else
      render :new  #lets us call field w/errors.  Keeps inputted data.  #renders users/new form.
    end

    @project = @client.projects.create(project_params)
    @project.user_id = current_user.id
    @project.save
    redirect_to client_project_path(@client, @project)
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
    raise params.inspect
    set_project
    if project_user_equals_current_user
      @project.update(project_params)
      redirect_to project_path(@project)
    else
      render :edit #allows for field with errors.
    end
  end

  def destroy
    set_project
    if project_user_equals_current_user
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

  def project_user_equals_current_user
    @project.user == current_user
  end

  def project_params
    params.require(:project).permit(:name, :description, :comments_attributes => [:content])
  end


end
