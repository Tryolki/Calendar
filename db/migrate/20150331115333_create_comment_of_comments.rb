class CreateCommentOfComments < ActiveRecord::Migration
  def change
    create_table :comment_of_comments do |t|
      t.string :content
      t.references :comment, index: true

      t.timestamps
    end
  end
end
