class PostsController < ApplicationController
  rescue_from CanCan::AccessDenied do |e|
    redirect_to action: "accessDenied"
  end

  def index
  	@posts = Post.all.paginate(page: params[:page], per_page: 3)
  end

  def accessDenied

  end

  def new
    @post = Post.new
    authorize! :create, @post
    @image = @post.images.new
  end

  def create
    @post = Post.new(post_params)
    @post.name = session[:user_id]
    add_images
    if @post.save
      redirect_to posts_url
    end
  end

  def show   
    @post = Post.find(params[:id])
    @comment = @post.comments.new 
    authorize! :read, @post
  end

  def edit
    @post = Post.find(params[:id])
    authorize! :edit, @post

  end

  def current_user
    User.find_by_username(session[:user_id])
  end

  def update
    puts 'parametrii'
    puts params.to_yaml
    @post = Post.find(params[:id])
    puts 'post'
    puts @post.to_yaml
    add_images
    if @post.update(post_params)
      redirect_to @post
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize! :destroy, @post
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
