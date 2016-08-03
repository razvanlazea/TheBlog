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
		params.require(:images).permit(:img, :post_id)
	end
end
