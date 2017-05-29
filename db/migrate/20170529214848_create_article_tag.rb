class CreateArticleTag < ActiveRecord::Migration
  def change
    create_table :article_tags do |t|
      t.integer :article_id
      t.integer :tag_id
    end
  end
end
