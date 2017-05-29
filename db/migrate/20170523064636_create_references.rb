class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.text :name
    end
  end
end
