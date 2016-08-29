class CreateEyedbs < ActiveRecord::Migration
  def change
    create_table :eyedbs do |t|
      t.string  :num
      t.string  :wc
      t.string  :season
      t.string  :tone
      t.string  :brand
      t.string  :name
      t.integer :price
      t.string  :size
      t.integer :zzim, default:"0"
      t.string  :pro_type
      t.string  :glitter
      t.string  :texture, default:"매트"
      t.string :image_url, default:""
      
      t.timestamps null: false
    end
  end
end
