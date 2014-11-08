class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :friend
      t.integer :user_id

      t.timestamps
    end
  end
end
