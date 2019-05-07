class CommentsController < ApplicationController

  def index
  end

  def new
    # raise params.inspect

    if (params[:project_id]) &&  @project = Project.find_by_id(params[:project_id])
    @comment = Comment.new
    @project.comments.build


    end
  end

  def create
    raise params.inspect
  end
end
