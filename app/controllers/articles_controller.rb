class ArticlesController < ApplicationController
  before_action :authenticate_admin!, :except => [:index, :show]
  respond_to :html, :json

  def new
    @article = Article.new
  end

  def edit
    my_article = Article.find(params[:id])
    if my_article.admin_id == current_admin.id
      @article = my_article
    else
      redirect_to :root
    end
  end

  def create
    @article = Article.new(article_params.merge(admin_id: current_admin.id))
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
    @articles = Article.all.map { |a| ArticlePresenter.new(a) }
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