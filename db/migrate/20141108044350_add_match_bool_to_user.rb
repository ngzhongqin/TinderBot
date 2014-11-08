class AddMatchBoolToUser < ActiveRecord::Migration
  def change
    add_column :users, :match, :Boolean
  end
end
