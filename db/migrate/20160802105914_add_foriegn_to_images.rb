class AddForiegnToImages < ActiveRecord::Migration
  def change
  	add_reference :images, :post, foreign_key: true
  end
end
