class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :like
      t.integer :user_id

      t.timestamps
    end
  end
end
