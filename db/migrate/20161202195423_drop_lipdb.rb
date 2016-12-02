class DropLipdb < ActiveRecord::Migration
  def change
    drop_table :lipdbs do |t|
      
      t.string  :num
      t.string  :image
      t.string  :wc
      t.string  :season
      t.string  :tone
      t.string  :brand
      t.string  :name
      t.string  :price
      t.string  :size
      t.string  :color
      t.string  :pro_type
      t.string  :glitter
      t.string  :texture
      t.string  :keyword
      t.string  :level

      t.timestamps null: false
    end
  end
end