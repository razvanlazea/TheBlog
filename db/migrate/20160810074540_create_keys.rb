class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.text :hash
      t.boolean :used

      t.timestamps
    end
  end
end
