class Post < ActiveRecord::Base

	belongs_to :user

	belongs_to :beacon

	has_many :favorites

	has_many :users, through: :favorites

	has_many :comments

end
