class RemoveBodyTextFromPosts < ActiveRecord::Migration
  def change
  	change_table :posts do |p|
      p.change :body_text, :string
    end
  end
end
