class AddBeaconIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :beacon_id, :integer
    add_index :posts, :beacon_id
  end
end
