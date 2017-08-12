class WelcomeController < ApplicationController
  def index
    @tech_articles = Article.last(5)
    @tech_articles = @tech_articles.map { |a| ArticlePresenter.new(a) }
  end
end