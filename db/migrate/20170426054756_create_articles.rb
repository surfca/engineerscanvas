class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :sub_title
      t.text :main_content
    end
  end
end