class CommentsController < ApplicationController
  before_action :find_comment, only: [:show, :destroy]
  def destroy
    @comment.destroy
    redirect_to comments_path
  end

  def create
    @post = Post.find(params[:post_id])  
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = 'Created comment successfully!'
      redirect_to post_path(@post)
    else
      flash[:error] = 'Failed to save comment!'
      render :template => 'posts/show'    #not redirect to
    end
  end

  private
  def find_comment
    @comment = comment.find(params[:id])
  end  

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end






