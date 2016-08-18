class CommentsController < ApplicationController
  def index
  	@comments = Post.find_by_id(params[:post_id]).comments
  end

  def new
  	@comment = Comment.new
  end

  def create
    	@comment = Comment.new(comment_params)
      @comment.post_id = params[:post_id]
      	
    if @comment.save
  	 respond_to do |format|
      format.html {redirect_to Post.find(params[:post_id])}
      format.js
     end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      respond_to do |format|
        format.html{ redirect_to Post.find(params[:post_id])}
        format.js 
     end
    end
  end

  def comment_params
  	params.require(:comment).permit(:name, :content, :post_id, :id)
  end
end
