class AddImageField < ActiveRecord::Migration
  def change
  	add_attachment :images, :img
  end
end
