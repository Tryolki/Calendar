class AddUserToCommentOfComments < ActiveRecord::Migration
  def change
    add_column :comment_of_comments, :user_name, :string
  end
end
