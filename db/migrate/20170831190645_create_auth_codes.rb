class CreateAuthCodes < ActiveRecord::Migration
  def change
    create_table :auth_codes do |t|
      t.string :code
      t.integer :admin_id
    end
  end
end
