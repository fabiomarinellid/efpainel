class AddColorToLabel < ActiveRecord::Migration[5.2]
  def change
    add_column :labels, :color, :string
  end
end
