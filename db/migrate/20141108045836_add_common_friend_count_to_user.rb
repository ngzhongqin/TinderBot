class AddCommonFriendCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :common_friend_count, :integer
  end
end
