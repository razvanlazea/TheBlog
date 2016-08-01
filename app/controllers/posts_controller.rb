class PostsController < ApplicationController
  # before_action :set_post, only: [:show, :edit, :update]
  def index
  	@posts = Post.all.paginate(page: params[:page], per_page: 3)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_url
    end
  end

  def show   
    @post = Post.find(params[:id])
    @comment = @post.comments.new 
  end

  def edit
    @post = Post.find(params[:id])
    @post.images << Image.find(4)
  end

  def update
    @post = Post.find(params[:id])
    
    if 
      redirect_to posts_url
    end
  end

  private
  # def set_post
  #   @post = Post.find(params[:id])
  # end

  def post_params    
    params.require(:posts).permit(:name, :title, :content)
  end

  def update_params
    params.permit(:id)
  end
  public
  def valid_user_and_pass
        params.to_yaml
      if params[:posts][:name] == USER
        $logged = true
        redirect_to posts_url
      else
        redirect_to posts_url
      end
  end

  def logout
    $logged = false
    redirect_to posts_url
  end
end
