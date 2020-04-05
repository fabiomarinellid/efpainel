class AddNameAndRoleAndSiteToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :role, :integer
    add_column :users, :site, :integer
  end
end
