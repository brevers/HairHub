class AddUserItToAgencies < ActiveRecord::Migration[7.0]
  def change
    add_column :agencies, :user_id, :integer
  end
end
