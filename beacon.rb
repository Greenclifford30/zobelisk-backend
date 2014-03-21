class Beacon < ActiveRecord::Base

	has_many :posts

	belongs_to :zone

end