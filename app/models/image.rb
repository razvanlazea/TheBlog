class Image < ActiveRecord::Base
	has_and_belongs_to_many :posts
	has_attached_file :img, styles: {
		small: "64x64",
		med: "100x100",
		large: "200x200"
	}
	validates_attachment :img, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
