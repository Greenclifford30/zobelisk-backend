class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :email
      t.timestamp :timestamp
      t.integer :likes
      t.string :title
      t.date :event_date
      t.text :body_text
      t.string :media

      t.timestamps
    end
  end
end
