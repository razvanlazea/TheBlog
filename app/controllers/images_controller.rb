class ImagesController < ApplicationController
	def new
		@image = Image.new
	end

	def create
		@image = Image.new(image_params)
		if @image.save
			redirect_to new_image_path
		end
	end

	def image_params
		params.require(:images).permit(:img)
	end
end
