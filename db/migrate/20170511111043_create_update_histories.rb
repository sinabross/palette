class CreateUpdateHistories < ActiveRecord::Migration
  def change
    create_table :update_histories do |t|
      
      t.string    :num
      t.string    :title
      t.string    :content
     
      t.timestamps null: false
    end
  end
end
