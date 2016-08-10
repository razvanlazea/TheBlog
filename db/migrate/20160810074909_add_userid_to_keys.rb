class AddUseridToKeys < ActiveRecord::Migration
  def change
  	add_reference :keys, :users, foreign_key: true
  end
end
