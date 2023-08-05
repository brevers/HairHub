class CreatePromotions < ActiveRecord::Migration[7.0]
    def change
      create_table :promotions do |t|
        t.string :code
        t.datetime :ends_at
  
        t.timestamps
      end
    end
  end