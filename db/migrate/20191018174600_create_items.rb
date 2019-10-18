class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :active
      t.integer :bestseller
      t.references :category, foreign_key: true
      t.references :label, foreign_key: true
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
