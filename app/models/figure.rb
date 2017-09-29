class Figure < ActiveRecord::Base
  has_attached_file :avatar, styles: { large: "2200x500#", medium: "990x350#", small: "150x150!"}, default_url: "images/:style/missing.png"
  validates_attachment :avatar, presence: true,
                        content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end