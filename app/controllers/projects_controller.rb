class ProjectsController < ApplicationController

  def index
  end

  def new
    # raise params.inspect
    if params[:client_id] && client = Client.find_by_id(params[:client_id])
      @project = client.projects.build
      # @project = current_user.projects.create(client: client)
    else
      @project = Project.new
    end
  end

  def create
    raise params.inspect
  end


end
