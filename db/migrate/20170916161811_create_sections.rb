class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.text :content
      t.integer :article_id
      t.integer :order_num
    end

    add_index :sections, :article_id
  end
end
