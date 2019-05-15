class CommentsController < ApplicationController

  def new
      # raise params.inspect
    if (params[:project_id]) && @project = Project.find_by_id(params[:project_id])
      @comment = @project.comments.build
    else
      redirect_to projects_path
    end
  end

  def create
    # raise params.inspect
    @project = Project.find(params[:comment][:project_id])  #Project already exists..not building new project so not passing project_id through params.
     if project_user_equals_current_user && @comment = @project.comments.create(comment_params)
      if @comment.save
        set_client_instance_variable_for_redirect
        redirect_to client_project_path(@client, @project)
      else
        render :new  #lets us call field w/errors.  Keeps inputted data.  #renders users/new form.
      end
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

  def comment_params
    params.require(:comment).permit(:content)
  end

end
