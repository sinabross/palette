class AddColumnsToRequestReplies < ActiveRecord::Migration
  def change
    add_column :request_replies, :secret, :string
     add_column :request_replies, :password, :string
  end
end
