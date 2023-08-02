class StripeProcessor
    attr_reader :payload, :endpoint_secret, :event, :signature
  
    def initialize(request)
      @payload = request.body.read
      @endpoint_secret = ENV["STRIPE_SECRET"]
      @signature = request.env["HTTP_STRIPE_SIGNATURE"]
    end
  
    def call
      parse_event
      case event.type
      when 'checkout.session.completed'
        handle_session_completed
      when 'payment_intent.succeeded'
        handle_payment_succeeded
      when 'payment_intent.payment_failed'
        handle_payment_failed
      when 'customer.subscription.updated'
        handle_subscription_updated
      else
        ignore_event
      end
    rescue StandardError => e
      error(e)
    end
  
    private
  
    def success(type, value)
      Struct.new(:success?, :type, :value).new(true, type, value)
    end
  
    def error(error)
      Struct.new(:success?, :error).new(false, error)
    end
  
    def parse_event
      @parse_event ||= Stripe::Webhook.construct_event(
        payload, signature, endpoint_secret
      )
    end
  
    def handle_session_completed
      if payment_status == "paid"
        success(:subscription, {
                  client_reference_id: client_reference_id,
                  stripe_customer_id: customer,
                  stripe_subscription_id: subscription
                })
      else
        failed_to_collect_payment
      end
    end
  
    def handle_payment_succeeded
      if payment_status == "succeeded"
        success(:payment, {
                  client_reference_id: client_reference_id,
                  amount: event.data.object.amount_received,
                  currency: event.data.object.currency,
                  payment_method: event.data.object.payment_method,
                  payment_intent_id: event.data.object.id
                })
      else
        failed_to_collect_payment
      end
    end
  
    def handle_payment_failed
      error("Payment failed. Please check your payment details and try again.")
    end
  
    def handle_subscription_updated
      success(:subscription_updated, {
                client_reference_id: client_reference_id,
                subscription_id: event.data.object.id,
                current_period_end: event.data.object.current_period_end,
                status: event.data.object.status
              })
    end
  
    def ignore_event
      success(:ignore, event.data.object)
    end
  
    def payment_status
      event.data.object.payment_status
    end
  
    def client_reference_id
      event.data.object.client_reference_id
    end
  
    def customer
      event.data.object.customer
    end
  
    def subscription
      event.data.object.subscription
    end
  
    def failed_to_collect_payment
      error("Failed to collect payment. Please try again soon.")
    end
  end
  