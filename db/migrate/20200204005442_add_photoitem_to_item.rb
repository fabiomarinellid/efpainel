class AddPhotoitemToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :photoitem, :string
  end
end
