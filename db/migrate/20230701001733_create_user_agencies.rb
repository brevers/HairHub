class CreateUserAgencies < ActiveRecord::Migration[7.0]
    def change
      create_table :user_agencies do |t|
        t.references :user, null: false, foreign_key: true
        t.references :agency, null: false, foreign_key: true
  
        t.timestamps
      end
    end
  end