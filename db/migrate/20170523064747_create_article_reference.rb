class CreateArticleReference < ActiveRecord::Migration
  def change
    create_table :article_references do |t|
      t.integer :article_id
      t.integer :reference_id
    end
  end
end
