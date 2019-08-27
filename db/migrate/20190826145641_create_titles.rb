class CreateTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :titles do |t|
      t.string :title
      t.string :subtitle
      t.text :text
      t.string :bestsellername
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
