class DropAskfors < ActiveRecord::Migration
  def change
    drop_table :askfors do |t|
      t.string :content
      t.string :status, default: "요청"
      t.timestamps null: false
    end
  end
end
