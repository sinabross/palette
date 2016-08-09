class CreateLipdbs < ActiveRecord::Migration
  def change
    create_table :lipdbs do |t|
      t.string  :num
      t.string  :wc
      t.string  :season
      t.string :tone
      t.string  :brand
      t.string  :name
      t.integer :price
      t.string  :size
      t.integer :zzim
      t.string  :pro_type
      t.boolean :glitter
      t.string  :texture
      t.string :image_url, default:""
      
      t.timestamps null: false
    end
  end
end
