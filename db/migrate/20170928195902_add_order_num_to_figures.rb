class AddOrderNumToFigures < ActiveRecord::Migration
  def change
    add_column :figures, :order_num, :integer, :default => 0
  end
end
