class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
    add_column :users, :userseason, :string, default: "봄"
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :birthday, :string
    #add_column :users, :image, :string
  end
end
