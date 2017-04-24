class Article < ActiveRecord::Base
  has_many :tags, through: :article_tags
  has_many :references, though: :article_references
  belongs_to :author
  belongs_to :category
end