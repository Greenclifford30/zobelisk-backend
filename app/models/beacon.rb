class Beacon < ActiveRecord::Base

	has_many :posts, dependent: :destroy

	belongs_to :zone

end
