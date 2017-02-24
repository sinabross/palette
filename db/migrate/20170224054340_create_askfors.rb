class CreateAskfors < ActiveRecord::Migration
  def change
    create_table :askfors do |t|
      t.string :brand, null:false
      t.string :name, null:false
      t.string :username, null:false, default:""
      t.timestamps null: false
    end
  end
end
