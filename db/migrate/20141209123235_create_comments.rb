class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :user_id
      t.string :user_name
      t.references :image_date, index: true

      t.timestamps
    end
  end
end
