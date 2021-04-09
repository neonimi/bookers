class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	def favorited_by? user
		# binding.pry
		favorites.where(user_id: user.id).exists?		
	end
end
