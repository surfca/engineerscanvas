class ArticlesController < ApplicationController
  before_action :certify_admin!, :except => [:index, :show]
  respond_to :html, :json

  def new
    @article = Article.new
  end

  def edit
    if admin_authorized?
      @article = get_article
      @figures = @article.figures
    else
      warn_logout!
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
    if admin_authorized?
      @article = get_article
      if @article.update_attributes(article_params)
        redirect_to article_url(@article)
      else
        render 'edit'
      end
    else
      warn_logout!
    end
  end

  def index
    if super_admin?
      @articles = Article.all.map { |a| ArticlePresenter.new(a) }
    else
      @articles = Article.visible.map { |a| ArticlePresenter.new(a) }
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

  def get_article
    article ||= Article.find(params[:id])
  end
  
  def admin_authorized?
    #is the admin who created this article?
    get_article.admin_id == current_admin.id
  end

  def certify_admin!
    authenticate_admin!
    #if current_admin is cerified return true otherwise signout current_admin
    current_admin.certified || (signout current_admin)
  end

  def warn_logout!
    flash[:notice] = "DONT DO THAT; You are editing someone else article???"
    current_admin.auth_code.uncertify!
    signout current_admin
  end

  def super_admin?
    (current_admin && current_admin.email == 'sowju19@gmail.com')
  end
end