class AddCommonLikeCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :common_like_count, :integer
  end
end
