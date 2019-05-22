class CommentsController < ApplicationController

  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :project_comment, only: [:update, :destroy]


  def new
    if (params[:project_id]) && @project = Project.find_by_id(params[:project_id])
      @comment = @project.comments.build
    else
      redirect_to projects_path
    end
  end

  def create
    @project = Project.find(params[:comment][:project_id])  #Project already exists..not building new project so not passing project_id through params.
     if project_user_equals_current_user && @comment = @project.comments.build(comment_params)
      if @comment.save
        redirect_to client_project_path(@project.client, @project)
      else
        render :new  #lets us call field w/errors.  Keeps inputted data.  #renders users/new form.
      end
    end
  end

  def edit

  end

  def update
      if project_user_equals_current_user && @comment.update(comment_params)
        redirect_to client_project_path(@project.client, @project)
      else
        render :edit #allows for field with errors.
      end
  end

  def destroy
      if project_user_equals_current_user
        @comment.destroy
        redirect_to client_project_path(@project.client, @project)
      end
  end


  private

  def set_comment
    @comment = Comment.find_by(id: params[:id])
    if !@comment
      redirect_to projects_path
    end
  end

  def project_comment
    @project = @comment.project
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
