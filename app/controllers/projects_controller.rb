class ProjectsController < ApplicationController

  def index
  end


    def new
        # raise params.inspect
      @client = Client.find(params[:client_id])
      @project = Project.new
    end

  #   if params[:client_id] && @client = Client.find_by_id(params[:client_id])
  #     @project = current_user.projects.create(client: client)
  #   end
  # end

  def create
    raise params.inspect
  end


end
