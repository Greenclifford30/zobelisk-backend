class Post < ActiveRecord::Base

	belongs_to :user

	belongs_to :beacon

	has_many :favorites, dependent: :destroy

	has_many :users, through: :favorites

	has_many :comments, dependent: :destroy

	acts_as_taggable_on :interests

end