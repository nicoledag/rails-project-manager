class CommentsController < ApplicationController

  def new
      # raise params.inspect
    if (params[:project_id]) && @project = Project.find_by_id(params[:project_id])
      @comment = @project.comments.build
    end
  end

  def create
    # raise params.inspect
    @project = Project.find(params[:comment][:project_id])
    set_client_instance_variable_for_redirect
    @comment = @project.comments.create(comment_params)

      if @comment.save
        redirect_to client_project_path(@client, @project)
      else
        render :new  #lets us call field w/errors.  Keeps inputted data.  #renders users/new form.
      end
  end

  def edit
    # raise params.inspect
    set_comment
  end

  def update
    # raise params.inspect
    set_comment
    set_project_instance_variable_for_redirect
    set_client_instance_variable_for_redirect
      if project_user_equals_current_user && @comment.update(comment_params)
        redirect_to client_project_path(@client, @project)
      else
        render :edit #allows for field with errors.
      end
  end

  def destroy
    # raise params.inspect
    set_comment
    set_project_instance_variable_for_redirect
    set_client_instance_variable_for_redirect
      if project_user_equals_current_user
        @comment.destroy
        redirect_to client_project_path(@client, @project)
      end
  end


  private

  def set_comment
    @comment = Comment.find_by(id: params[:id])
    if !@comment
      redirect_to projects_path
    end
  end

  def set_client_instance_variable_for_redirect
    @client = @project.client
  end

  def set_project_instance_variable_for_redirect
    @project = @comment.project
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
