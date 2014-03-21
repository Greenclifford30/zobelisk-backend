class CreateBeacons < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.string :name
      t.string :lat
      t.string :long
      t.string :beacon

      t.timestamps
    end
  end
end
