class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.float :volume
      t.references :fridge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
