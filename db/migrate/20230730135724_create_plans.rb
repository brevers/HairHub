class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :price
      t.references :agency, null: false, foreign_key: true

      t.timestamps
    end
  end
end