class Agency < ApplicationRecord
  belongs_to :user, optional: true

  alias_attribute :owner, :user

  has_many :messages
end
