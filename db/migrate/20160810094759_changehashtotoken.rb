class Changehashtotoken < ActiveRecord::Migration
  def change
  	rename_column :keys, :hash, :token
  end
end
