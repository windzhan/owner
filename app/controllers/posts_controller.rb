class PostsController < ApplicationController
  before_action :signed_in_user, only: [ :create, :destroy]
  before_action :find_post, only: [:show, :destroy] 
  def new
    @post=Post.new
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

   def index
    @post=Post.all
  end

  def show
    @comment = Comment.new  #对应post/show的<% @post.comments.each do |comment| %>

  end

  def create
    @post = current_user.posts.build(post_params)
    @post.category_id = params[:category_id]
    if @post.save
      flash[:notice] = 'Created post successfully!'
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
  def find_post
      @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title,:body,:slug,:user_id,:category_id)
  end
end