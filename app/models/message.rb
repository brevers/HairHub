class Message < ApplicationRecord
  validates_presence_of :content

  belongs_to :agency
  belongs_to :user

  def self.user_messages_grouped_by_agency(user)
    self.preload(:agency).where(user: user).group_by {|m| m.agency.name}
  end
end
