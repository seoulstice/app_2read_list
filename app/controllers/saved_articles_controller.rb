class SavedArticlesController < ApplicationController
  before_action :set_user, only: [:create, :index]

  def create
    @saved_article = @user.saved_articles.new(saved_article_params)
    if @saved_article.save
      redirect_to user_saved_articles_path(@user)
    else
      redirect_to popular_path
    end
  end

  def index
    @saved_articles = @user.saved_articles.all
  end

end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def saved_article_params
    params.require(:saved_article).permit(:abstract, :authors, :nyt_id, :photo, :published_date, :section, :title, :url)
  end
