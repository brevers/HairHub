# frozen_string_literal: true

class AddPhoneToAgencies < ActiveRecord::Migration[7.0]
  def change
    add_column :agencies, :phone, :string
  end
end

