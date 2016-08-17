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
  	 redirect_to Post.find(params[:post_id])
      
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html{ redirect_to Post.find(params[:post_id])}
      format.json {head :no_content}
      format.js  { render :layout => false}
    end
  end

  def comment_params
  	params.require(:comment).permit(:name, :content, :post_id, :id)
  end
end
