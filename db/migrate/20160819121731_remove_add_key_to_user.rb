class RemoveAddKeyToUser < ActiveRecord::Migration
  def change
  	remove_reference :roles, :user, foreign_key: true
  	add_reference :users, :role, foreign_key: true
  end
end
