class AddStripeReferenceIdToUsers < ActiveRecord::Migration[7.0]
    def change
      add_column :users, :stripe_reference_id, :string
    end
  end
  