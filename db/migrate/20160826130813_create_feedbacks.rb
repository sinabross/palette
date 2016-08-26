class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :title
      t.string :content
      t.string :emailaddress
      t.string :pro_num
      t.string :img_url, default:""
      
      t.timestamps null: false
    end
  end
end
