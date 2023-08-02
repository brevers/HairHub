# frozen_string_literal: true

class Agency < ApplicationRecord
  belongs_to :user, optional: true

  alias_attribute :owner, :user

  has_many :messages, dependent: :destroy
  has_many :plans, dependent: :destroy

  def messages_grouped_by_user
    messages.group_by(&:user)
  end
end
