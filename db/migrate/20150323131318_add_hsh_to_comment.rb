class AddHshToComment < ActiveRecord::Migration
  def change
    add_column :comments, :hsh, :string
  end
end
