class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :title
      t.text :description
      t.float :price
      t.integer :agency_id

      t.timestamps
    end
  end
end
