class CreateFigures < ActiveRecord::Migration
  def change
    create_table :figures do |t|
      t.string :fig_name
      t.integer :order_fig
      t.integer :article_id
    end

    add_index :figures, :article_id
  end
end
