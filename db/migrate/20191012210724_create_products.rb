class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :status
      t.integer :bestseller
      t.references :category, foreign_key: true
      t.references :label, foreign_key: true
      t.string :photo
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
