class CommentsController < ApplicationController
  def new
  end

  def create
  	@post = Post.find(params[:post_id])
  	@comment = Comment.new(comment_params)
  	if @comment.save
  		redirect_to posts_path
  	end
  end


  def comment_params
  	params.require(:comments).permit(:name, :content, :post_id)
  end
end
