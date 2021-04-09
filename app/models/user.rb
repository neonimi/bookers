class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable
	has_many :books
	mount_uploader :image, ImageUploader
	
	has_many :active_relationships, class_name: 'Relationship', foreign_key: :following_id
	has_many :passive_relationships, class_name: 'Relationship', foreign_key: :followed_id
	has_many :followings, through: :active_relationships, source: :followed
	has_many :followers, through: :passive_relationships, source: :following
	def followed_by?(user)
		passive_relationships.find_by(following_id: user.id).present?
	end

	has_many :favorites, dependent: :destroy
end
