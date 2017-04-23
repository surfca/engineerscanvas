class Article < ActiveRecord::Base
  has_many :tags
end