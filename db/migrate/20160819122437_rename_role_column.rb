class RenameRoleColumn < ActiveRecord::Migration
  def change
  	rename_column :roles, :role, :type
  end
end
