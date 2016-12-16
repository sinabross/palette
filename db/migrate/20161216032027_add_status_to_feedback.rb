class AddStatusToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :status, :string, default: "요청"
  end
end
