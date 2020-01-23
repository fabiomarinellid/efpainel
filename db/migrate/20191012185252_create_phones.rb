class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.string :name
      t.string :phone
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
