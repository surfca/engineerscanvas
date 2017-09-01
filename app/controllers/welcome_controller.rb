class WelcomeController < ApplicationController
  def index
    @tech_articles = Article.last(5)
    @tech_articles = @tech_articles.map { |a| ArticlePresenter.new(a) }
  end

  def certify_me
    authenticate_admin!
    @admin = current_admin
  end

  def certified
    authenticate_admin!
    if params[:my_code] && (current_admin.auth_code.try(:code) == params[:my_code])
      current_admin.certified = true
      current_admin.save
      flash[:notice] = "Authorized to create Articles"
      redirect_to :root
    else
      flash[:error] = "Authorization code invalid"
      redirect_to :root
    end
  end
end