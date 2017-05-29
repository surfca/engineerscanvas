class AddTwitterShareTextToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :twitter_share_text, :string
  end
end
