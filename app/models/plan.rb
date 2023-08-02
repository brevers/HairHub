class Plan < ApplicationRecord
  belongs_to :agency

  # HERE: Add more validations
  validates :title, :description, :price, presence: true
end
