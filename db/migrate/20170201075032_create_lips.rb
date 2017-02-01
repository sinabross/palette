class CreateLips < ActiveRecord::Migration
  def change
    create_table :lips do |t|

      t.string  :num
      t.string  :image
      t.string  :name
      t.string  :brand
      t.string  :level
      t.string  :color
      t.string  :wc
      t.string  :tone
      t.string  :season
      t.string  :price
      t.string  :size
      t.string  :pro_type
      t.string  :glitter
      t.string  :texture
      t.string  :keyword

      t.timestamps null: false
    end
end
