# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, %i[client owner]

  has_one :user_subscription, dependent: :destroy

  alias_attribute :subscription, :user_subscription

  has_many :agencies, dependent: :destroy

  before_create :set_stripe_reference_id

  def claim(agency)
    raise if agency.blank?

    AgencyRegistrationService.new(self, agency).call
  end

  private

  def set_stripe_reference_id
    return unless owner?

    self.stripe_reference_id = Devise.friendly_token
  end
end

