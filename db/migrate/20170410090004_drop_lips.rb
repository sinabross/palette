class DropLips < ActiveRecord::Migration
  def change
    drop_table :lips do |t|

      t.string  :num
      t.string  :image
      t.string  :name
      t.string  :brand
      t.string  :level
      t.string  :color
      t.string  :wc
      t.string  :tone_weak1, default: " "
      t.string  :tone_weak2, default: " "
      t.string  :tone_strong1, default: " "
      t.string  :tone_strong2, default: " "
      t.string  :season_1
      t.string  :season_2
      t.string  :price
      t.string  :size
      t.string  :pro_type
      t.string  :glitter
      t.string  :texture
      t.string  :keyword

      t.timestamps null: false
    end
  end
end
