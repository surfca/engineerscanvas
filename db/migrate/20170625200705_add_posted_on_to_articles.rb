class AddPostedOnToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :posted_on, :datetime
  end
end
