class ArticlesController < ApplicationController
  # before_action :set_current_article, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def set_current_article
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.includes(:user).order(updated_at: :desc).page(params[:page]).per(5)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      flash[:notice] = "記事を投稿しました"
      redirect_to root_path
    else
      flash[:alert] = "エラーが発生しました"
      render :new
    end
  end

  def edit
    set_current_article
  end

  def update
    set_current_article
    @article.update(article_params)
    redirect_to root_path
    flash[:notice] = "記事を更新しました"
  end

  def destroy
    set_current_article
    @article.destroy
    redirect_to root_path
    flash[:notice] = "記事を削除しました"
  end

  private
  def article_params
    # params.permit(:title, :body)
    params.require(:article).permit(:title, :body)
  end

  # def move_to_index
  #   redirect_to root_path unless user_signed_in?
  # end
end
