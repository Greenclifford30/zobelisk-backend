class CreatePostsAgain < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :email
      t.timestamp :timestamp
      t.integer :likes
      t.string :title
      t.date :event_date
      t.string :body_text
      t.string :media
      t.integer :beacon_id
      t.integer :user_id
      t.timestamps
    end
  end
end
