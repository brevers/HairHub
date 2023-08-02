# frozen_string_literal: true

module SubscriptionsHelper
    def available_subscriptions
      Subscription.all.order(:name).map do |s|
        ["#{s.name} - #{number_to_currency(s.price)} / month", s.id]
      end
    end
  end