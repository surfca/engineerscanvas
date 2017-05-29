class ArticlesController < ApplicationController
  before_action :authenticate_admin!, :except => [:index, :show]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_url
    else
      render new
    end
  end

  def update
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
  end

  def article_params
    params.require(:article).permit(:title,:sub_title,:main_content)
  end
end