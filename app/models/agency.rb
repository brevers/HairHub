class Agency < ApplicationRecord
  belongs_to :user, optional: true

  alias_attribute :owner, :user

  has_many :messages

  def messages_grouped_by_user
    messages.group_by do |m| m.user end
  end
end
