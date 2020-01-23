class AddPhotologoToTitle < ActiveRecord::Migration[5.2]
  def change
    add_column :titles, :photologo, :string
  end
end
