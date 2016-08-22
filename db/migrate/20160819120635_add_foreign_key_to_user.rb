class AddForeignKeyToUser < ActiveRecord::Migration
  def change
  	add_reference :roles, :user, foreign_key: true
  	add_column :roles, :role, :text
  end
end
