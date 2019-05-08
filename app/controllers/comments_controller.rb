class CommentsController < ApplicationController

  def index
  end

  def new
    (params[:project_id]) && project = Project.find_by_id(params[:project_id])
    # raise params.inspect
    @comment = project.comments.build
  end

  def create
    # raise params.inspect
    if (params[:comment][:project_id])
      @project = Project.find(params[:comment][:project_id])
      @client = @project.client_id
      @comment = @project.comments.create(comment_params)
      redirect_to client_projects_path(@client, @project)
    else
      render :new  #lets us call field w/errors.  Keeps inputted data.  #renders users/new form.
    end
  end

  def show
    set_comment
  end

  private

  def set_comment
    @comment = Comment.find_by(id: params[:id])
    if !@comment
      redirect_to projects_path
    end
  end

  def comment_params
    params.require(:comment).permit(:content) #TOOK OUT PROJECT ID!
  end
end
