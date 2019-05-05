class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index
    @user = User.find(params[:id])
  end

  def create
    Favorite.create(user_id: current_user.id, article_id: params[:article_id])
    redirect_to root_path
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, article_id: params[:article_id])
    @favorite.destroy
    redirect_to root_path
  end
end
