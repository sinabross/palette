class DropRequests < ActiveRecord::Migration
  def change
    drop_table :requests do |t|

      t.string  :title
      t.text    :content
      t.string  :nickname
      t.integer :group
      t.integer :level
      t.string  :img_url, default:""
      t.integer :hits
      t.string  :secret
      t.string  :password

      t.timestamps null: false
    end
  end
end
