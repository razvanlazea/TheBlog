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
  		redirect_to Post.find_by_id(params[:post_id]) 
  	end
  end


  def comment_params
  	params.require(:comment).permit(:name, :content, :post_id)
  end
end
