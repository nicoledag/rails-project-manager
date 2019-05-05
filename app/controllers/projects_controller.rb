class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end


    def new
        # raise params.inspect
      @client = Client.find_by_id(params[:client_id])
      @project = @client.projects.build
    end

  #   if params[:client_id] && @client = Client.find_by_id(params[:client_id])
  #     @project = current_user.projects.create(client: client)
  #   end
  # end

  def create
    # raise params.inspect

    @client = Client.find(params[:client_id])
    @project = @client.projects.create(project_params)
    @project.user_id = current_user.id
    @project.save
    # @project = current_user.projects.create(project_params)
    # if @project.save
      redirect_to client_project_path(@client, @project)
    # else
    # #if the user information does'nt save from validation.
    #   render :new  #lets us call field w/errors.  Keeps inputted data.  #renders users/new form.
    # end
  end

  def show
    # raise params.inspect
    @project = Project.find_by(id: params[:id])
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, params[:client_id])
  end


end
