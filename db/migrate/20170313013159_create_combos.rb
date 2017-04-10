class CreateCombos < ActiveRecord::Migration[5.0]
  def change
    create_table :combos do |t|
      t.string :name
      t.string :description
      t.integer :discount
      t.string :image
      t.datetime :from
      t.datetime :to

      t.timestamps
    end
  end
end
