class Reference < ActiveRecord::Base
  has_many :articles, through: :article_references
end