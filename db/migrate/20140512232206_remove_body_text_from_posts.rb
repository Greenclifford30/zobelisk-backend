class RemoveBodyTextFromPosts < ActiveRecord::Migration
  def change
  	change_table :posts do |p|
      p.change :text_body, :string
    end
  end
end
