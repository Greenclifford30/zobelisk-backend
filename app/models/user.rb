class User < ActiveRecord::Base
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable and :omniauthable
devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :posts, dependent: :destroy

has_many :comments, dependent: :destroy

has_many :favorites

acts_as_taggable

acts_as_taggable_on :tags

# This method associates the attribute ":avatar" with a file attachment
has_attached_file :avatar, styles: {
	thumb: '100x100>',
	square: '200x200#',
	medium: '300x300>'
}

# Validate the attached image is image/jpg, image/png, etc
validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end