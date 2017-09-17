class FiguresController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @figure = Figure.new(article_id: @article_id)
  end

  def create
    @figure = Figure.new(figure_params)
    puts "I am figure params #{figure_params}"
    @article = Article.find(params[:article_id])
    if @figure.save
      redirect_to article_url(@article)
    else
      render new
    end
  end

  def index
  end

  def edit
  end

  def delete
  end

  def update
  end

  def show
  end

  private

  def figure_params
    params.require(:figure).permit(:fig_name, :order_fig, :avatar, :article_id)
  end
end
