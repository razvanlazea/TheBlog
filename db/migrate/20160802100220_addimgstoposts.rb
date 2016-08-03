class Addimgstoposts < ActiveRecord::Migration
  def change
  	add_column :posts, :imgs, :string, array: true, default: []
  end
end
