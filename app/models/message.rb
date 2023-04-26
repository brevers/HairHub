class Message < ApplicationRecord
  validates_presence_of :content

  belongs_to :agency
  belongs_to :user
end
