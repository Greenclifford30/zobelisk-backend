class Tag < ActiveRecord::Base

	has_many :users

	has_many :posts

end
