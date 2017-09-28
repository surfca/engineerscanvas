class Article < ActiveRecord::Base
  has_many :article_tags
  has_many :figures, dependent: :destroy
  has_many :sections, dependent: :destroy
  has_many :tags, :through => :article_tags
  
  has_many :references, through: :article_references
  belongs_to :admin
  belongs_to :category
  scope :visible, -> { where(visible: true) }
end