class CommentsController < ApplicationController
  
  def new 
  end

  def create
    @comment = current_user.comments.build(comment_params)
  end 

  def destroy
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
