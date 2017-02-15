class CreateRequestReplies < ActiveRecord::Migration
  def change
    create_table :request_replies do |t|

      t.string  :title
      t.text    :content
      t.string  :nickname
      t.integer :request_id
      t.integer :group
      t.integer :level
      t.string  :img_url, default:""
      t.integer :hits
      
      t.timestamps null: false
    end
  end
end
