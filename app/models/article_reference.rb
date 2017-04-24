class ArticleReference < ActiveRecord::Base
  belongs_to :article
  belongs_to :reference
end