class AddPrincipalbuttondescriptionToTitles < ActiveRecord::Migration[5.2]
  def change
    add_column :titles, :principalbuttondescription, :string
  end
end
