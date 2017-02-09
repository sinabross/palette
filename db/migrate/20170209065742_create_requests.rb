class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|

      t.string :title
      t.string :content
      t.string :nickname
      t.string :pro_num, default:""
      t.string :img_url, default:""

      t.timestamps null: false
    end
  end
end
