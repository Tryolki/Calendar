class CreateSocnets < ActiveRecord::Migration
  def change
    create_table :socnets do |t|
      t.string :network
      t.references :user, index: true

      t.timestamps
    end
  end
end
