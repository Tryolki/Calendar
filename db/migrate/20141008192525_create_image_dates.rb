class CreateImageDates < ActiveRecord::Migration
  def change
    create_table :image_dates do |t|
      t.date :date
      t.string :images
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end
end
