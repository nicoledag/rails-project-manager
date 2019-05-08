class CommentsController < ApplicationController

  def index
  end

  def new


    (params[:project_id]) && @project = Project.find_by_id(params[:project_id])
    # raise params.inspect
    @comment = @project.comments.build


  end

  def create
    raise params.inspect
  end
end
