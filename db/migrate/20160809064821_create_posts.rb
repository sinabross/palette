class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    
      t.string :brand
      t.string :name
      t.string :size
      t.integer :price
      t.string :tone
      t.string :image_url, default: ""

      t.timestamps null: false
    end
  end
end
