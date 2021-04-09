class FavoritesController < ApplicationController
	before_action :authenticate_user!

  def create
  	# binding.pry
  	@book = Book.find(params[:book_id])
  	favorite = current_user.favorites.build(book: @book)
    favorite.save
  	# if @favorite.save
  	# 	redirect_to root_path, notice: "お気に入りに登録しました"
  	# else
  	# 	redirect_to books_path, alert: "この投稿はお気に入りに登録できません"
  	# end	
  end

  def destroy
    # binding.pry
    @book = Book.find(params[:book_id])
  	favorite = current_user.favorites.find_by!(book_id: @book)
  	favorite.destroy
  	# redirect_to books_path, notice: "お気に入りを解除しました"
  end
end
