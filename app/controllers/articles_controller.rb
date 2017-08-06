class ArticlesController < ApplicationController
  before_action :authenticate_admin!, :except => [:index, :show]
  respond_to :html, :json

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
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
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to article_url(@article)
    else
      render 'edit'
    end
  end

  def index
    @articles_to_decorate = Article.all
    @articles = []
    @articles = @articles_to_decorate.map do |a|
      ArticlePresenter.new(a)
    end
    respond_with(@articles)
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
  end

  private
  def article_params
    params.require(:article).permit(:title,:sub_title,:main_content,:posted_on)
  end
end