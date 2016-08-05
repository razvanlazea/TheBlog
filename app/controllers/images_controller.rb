class ImagesController < ApplicationController
	def new
		@image = Image.new
	end

	def create
		@image = Image.new(image_params)
		@image.post_id = params[:post_id]
		
		if @image.save
			redirect_to posts_url
		end
	end

	def image_params
		params.require(:images).permit(:img, :post_id, :id)
	end

	def destroy
		@image = Image.find(params[:id])
		@image.delete
		post = Post.find(params[:post_id])
		redirect_to edit_post_path(post)
	end
end
