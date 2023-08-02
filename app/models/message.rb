# frozen_string_literal: true

class Message < ApplicationRecord
  validates :content, presence: true
  attr_accessor :user_mobile_number

  belongs_to :agency
  belongs_to :user

  after_create :text_user_followup_message

  def self.user_messages_grouped_by_agency(user)
    preload(:agency).where(user: user).group_by { |m| m.agency.name }
  end

  private

  # Probably better suited for a background job.
  def text_user_followup_message
    TwilioService.new(
      user_mobile_number,
      followup_message
    ).call
  end

  def followup_message
    "Thanks for reaching out!\nWe will contact you soon.\nYour friends at #{agency.name} ✌️"
  end
end
