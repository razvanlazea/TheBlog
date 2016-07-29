class CreateImagesPosts < ActiveRecord::Migration
  def change
    create_table :images_posts, id: false do |t|
      t.belongs_to :image, index: true
      t.belongs_to :post,  index: true
      
      t.timestamps
    end
  end
end
