class ProjectsController < ApplicationController

  def index
  end

  def new
    # raise params.inspect
    if params[:client_id] && client = Client.find_by_id(params[:client_id])
      @project = client.projects.build
    else
      @project = Project.new
    end
  end


end
