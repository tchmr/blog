class ArticlesController < ApplicationController
  # before_action :current_article, only: [:edit, :update, :destroy]

  def current_article
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all.order(updated_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "記事を投稿しました"
      redirect_to root_path
    else
      flash[:alert] = "エラーが発生しました"
      render :new
    end
  end

  def edit
    current_article
  end

  def update
    current_article
    @article.update(article_params)
    redirect_to root_path, notice: "記事を更新しました"
  end

  def destroy
    current_article
    @article.destroy
    redirect_to root_path notice: "記事を削除しました"
  end

  private
  def article_params
    # params.permit(:title, :body)
    params.require(:article).permit(:title, :body)
  end
end
