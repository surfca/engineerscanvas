class Figure < ActiveRecord::Base
  has_attached_file :avatar, styles: { large: "2560x440#", medium: "300x300!", small: "150x150!", thumb: "50x50!" }, default_url: "images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end