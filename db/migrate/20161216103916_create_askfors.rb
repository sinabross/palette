class CreateAskfors < ActiveRecord::Migration
  def change
    create_table :askfors do |t|
      t.string :content
      t.string :status, default: "요청"
      t.timestamps null: false
    end
  end
end
