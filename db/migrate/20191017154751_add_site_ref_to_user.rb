class AddSiteRefToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :site, foreign_key: true
  end
end
