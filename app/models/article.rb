class Article < ActiveRecord::Base
  has_many :article_tags
  has_many :tags, :through => :article_tags
  
  has_many :references, through: :article_references
  belongs_to :author
  belongs_to :category
end