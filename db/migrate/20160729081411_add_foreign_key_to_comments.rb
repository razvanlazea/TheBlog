class AddForeignKeyToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :content, :text
  	add_column :comments, :name, :text

  	add_reference :comments, :post, foreign_key: true
  end
end
