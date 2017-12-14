class CommentsController < ApplicationController
  before_action :find_comment, only: [:show, :destroy]
  #def new
    #@comment = @post.comments.build
    #@comment = Comment.new(:post_id => @post.id)
    #@post.comments = Comment.new(:post_id => @post.id)
    #@users = User.all.map{|c| [ c.name, c.id ] }
    #@posts = Post.all.map{|c| [ c.title, c.id ] }
  #end

  #def show
  #end

  def destroy
    @comment.destroy
    redirect_to comments_path
  end

  def create
    @post = Post.find(params[:post_id])
    #@post = current_user.posts.build(post_params)
    #@comment = @post.comments.create(comment_params)
    #@comment.post_id = params[:post_id]
    
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    
    #@comment = Comment.new(comment_params) 
    if @comment.save
      flash[:notice] = 'Created comment successfully!'
      redirect_to post_path(@post),notice: "已评论"
    else
      flash[:error] = 'Failed to save comment!'
      render :template => 'posts/show'
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






