class CreateObservations < ActiveRecord::Migration[5.2]
  def change
    create_table :observations do |t|
      t.text :description
      t.integer :status
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
