class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  # Index page
  def index
    @posts = Post.all.order("created_at DESC")
  end


  # New blog post
  def new
    @post = Post.new
  end


  # Create blog post
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end


  # Show blog posts
  def show
  end


  # Edit post
  def edit
  end


  # Update post
  def update
    if @post.update (post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end


  # Destroy post
  def destroy
    @post.destroy
    redirect_to root_path
  end


  # Find a blog post
  def find_post
    @post = Post.find(params[:id])
  end

  private

  # Submit blog post into DB
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
