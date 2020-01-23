class AddPhotoavatarToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :photoavatar, :string
  end
end
