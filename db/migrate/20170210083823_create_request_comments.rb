class CreateRequestComments < ActiveRecord::Migration
  def change
    create_table :request_comments do |t|

      t.text :content
      t.string  :nickname
      t.integer :request_id
      
      t.timestamps null: false
    end
  end
end
