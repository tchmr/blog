class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = @user.articles.order(created_at: :DESC).page(params[:page]).per(5)
  end

  def favorites
    @user = User.find(params[:id])
    @favorites = @user.favorites
    # @favorites = Favorite.find_by(user_id: @user.id)
  end
end
