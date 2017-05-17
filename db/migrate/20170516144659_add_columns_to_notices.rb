class AddColumnsToNotices < ActiveRecord::Migration
  def change
    add_column :notices, :special, :string
  end
end
