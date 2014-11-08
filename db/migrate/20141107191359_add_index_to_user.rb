class AddIndexToUser < ActiveRecord::Migration
  def change
    add_column :users, :tinder_id, :string
    add_index :users, :tinder_id, unique: true
  end
end
