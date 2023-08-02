# frozen_string_literal: true

class StripeController < ApplicationController
    protect_from_forgery except: :webhook
  
    def webhook
      StripeProcessor.new(request).call.tap do |result|
        # HERE: Don't think any these work...
        if result.success?
          case result.type
          when :subscription
            update_user_for_subscription(result)
          when :payment
            handle_successful_payment(result)
          when :subscription_updated
            handle_subscription_updated(result)
          else
            head :ok
          end
        else
          head :internal_server_error
        end
      end
    end
  
    private
  
    def maybe_update_user(result)
      return unless result.type == :subscription
  
      result.value.tap do |stripe_attrs|
        user = User.find_by(stripe_reference_id: stripe_attrs[:client_reference_id])
  
        user.update \
          stripe_customer_id: stripe_attrs[:stripe_customer_id],
          stripe_subscription_id: stripe_attrs[:stripe_subscription_id]
      end
    end
  end
  