class AddDistanceMiToUser < ActiveRecord::Migration
  def change
    add_column :users, :distance_mi, :integer
  end
end
