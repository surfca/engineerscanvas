class AddCertifiedToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :certified, :boolean, :default => false
  end
end
