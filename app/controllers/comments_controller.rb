class CommentsController < ApplicationController

  def index
  end

  def new
    (params[:project_id]) && @project = Project.find_by_id(params[:project_id])
    # raise params.inspect
    @comment = @project.comments.build
  end

  def create
    # raise params.inspect
    if (params[:comment][:project_id])
      project = Project.find(params[:comment][:project_id])
      @comment = project.comments.create(comment_params)
      redirect_to projects_path
    else
      render :new  #lets us call field w/errors.  Keeps inputted data.  #renders users/new form.
    end
  end

  def comment_params
    params.require(:comment).permit(:content) #TOOK OUT PROJECT ID!
  end
end
