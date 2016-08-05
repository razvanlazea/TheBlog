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
    params[:posts][:name] = "da"
    puts params.to_yaml
    @post = Post.new(post_params)
    @post.name = session[:user_id]
    add_images
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
    
  end

  def update
    @post = Post.find(params[:id])
    add_images
    if @post.update(post_params)
      redirect_to @post
    end
  end

  def destroy
    @post = Post.find(params[:id])
    # delete all comments from @post
    @comments = Comment.all
    @comments.each do |comment|
      if comment.post_id == @post.id
        comment.destroy
      end
    end
    # delete all images from @post
    @images = Image.all
    @images.each do |image|
      if image.post_id == @post.id
        image.delete
      end
    end

    # delete @post
    @post.destroy

    redirect_to posts_url
  end  


  def post_params    
    params.require(:post).permit(:name , :title, :content, :image, :post_id)
  end

  def image_params
    params.permit(:image, :post_id)
  end

  def add_images
    if params[:post][:image]
      params['post']['image'].each do |key, value|
        @post.images << Image.new(:img => value, :post_id => params[:post_id])
      end
    end
  end
end
