class Post < ActiveRecord::Base

	belongs_to :user

	belongs_to :beacon

	has_many :favorites, dependent: :destroy

	has_many :users, through: :favorites, dependent: :destroy

	has_many :comments, dependent: :destroy

end