class ProjectsController < ApplicationController

  def index
  end

  def new
    # raise params.inspect
    if params[:client_id]
      client = Client.find_by_id(params[:client_id])
      @project = current_user.projects.build(client: client)
    else
      @project = Project.new
    end
  end

  def create
    # raise params.inspect
  end


end
