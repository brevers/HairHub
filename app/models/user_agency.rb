class UserAgency < ApplicationRecord
    belongs_to :user
    belongs_to :agency
  end