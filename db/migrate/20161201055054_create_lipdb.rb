class CreateLipdb < ActiveRecord::Migration
  def change
    create_table :lipdbs do |t|
      
      t.string  :num
      t.string  :image
      t.string  :color_PA
      t.string  :season_PA
      t.string  :tone_PA
      t.string  :color_BY
      t.string  :season_BY
      t.string  :tone_BY
      t.string  :color_YS
      t.string  :season_YS
      t.string  :tone_YS
      t.string  :color_total
      t.string  :season_total
      t.string  :tone_total
      t.string  :comment_PA
      t.string  :comment_BY
      t.string  :comment_YS
      t.string  :brand
      t.string  :name
      t.integer :price
      t.string  :size
      t.integer :zzim, default:"0"
      t.string  :pro_type
      t.string  :glitter
      t.string  :texture
      t.string  :keyword

      t.timestamps null: false
    end
  end
end