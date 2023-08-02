class CreateSubscriptions < ActiveRecord::Migration[7.0]
    def change
      create_table :subscriptions do |t|
        t.string :name, null: false
        t.integer :price, null: false
        t.boolean :active
  
        t.timestamps
      end
    end
  end
  