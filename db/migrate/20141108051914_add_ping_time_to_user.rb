class AddPingTimeToUser < ActiveRecord::Migration
  def change
    add_column :users, :ping_time, :datetime
  end
end
