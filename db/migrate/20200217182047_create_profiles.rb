class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :code
      t.string :description
      t.integer :father
      t.string :route
      t.integer :read
      t.integer :create
      t.integer :edit
      t.integer :erase
      t.integer :active
      t.integer :order
      t.string :icon
      t.integer :level
      t.string :controller_name
      t.references :user, foreign_key: true
      t.references :site, foreign_key: true


      t.timestamps
    end
  end
end
