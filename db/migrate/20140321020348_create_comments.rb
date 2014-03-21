class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :email
      t.timestamp :timestamp
      t.text :text_body

      t.timestamps
    end
  end
end
