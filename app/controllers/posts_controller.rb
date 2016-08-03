class PostsController < ApplicationController
  # before_action :set_post, only: [:show, :edit, :update]
  def index
  	@posts = Post.all.paginate(page: params[:page], per_page: 3)
  end

  def new
    @post = Post.new
    @image = @post.images.new
  end

  def create
    # puts params.to_yaml
    @post = Post.new(post_params)
    params['post']['image'].each do |key, value|
      @post.images << Image.new(:img => value, :post_id => params[:post_id])
    end
      
    if @post.save #&& @image.save
      redirect_to posts_url
    end
  end

  def show   
    @post = Post.find(params[:id])
    @comment = @post.comments.new 
  end

  def edit
    @post = Post.find(params[:id])
    # @post.images << Image.find(4)
  end

  def update
    @post = Post.find(params[:id])
    
    if 
      redirect_to posts_url
    end
  end

  def post_params    
    params.require(:post).permit(:name, :title, :content, :image, :post_id)
  end

  def image_params
    params.permit(:image, :post_id)
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
