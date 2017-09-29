require 'delegate'

class ArticlePresenter < SimpleDelegator
  extend ActiveModel::Naming

  def to_model
    self
  end

  def intro
    @intro = model.main_content[0..100]
  end

  def welcome_image
    model.figures[0].avatar.url(:small)
  end
  #returns a reference to the object that the method calls are being delegated to
  def model
    __getobj__
  end
end