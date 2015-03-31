class AddUserIdToCommentOfComments < ActiveRecord::Migration
  def change
    add_column :comment_of_comments, :user_id, :integer
  end
end
