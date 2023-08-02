class TwilioService
    cattr_accessor :account_sid, :auth_token, :twilio_number, :twilio_whatsapp_number
    attr_reader :to_mobile_number, :message_body, :client
  
    def initialize(to_mobile_number, message_body)
      @to_mobile_number = to_mobile_number
      @message_body = message_body
      @client = Twilio::REST::Client.new(TwilioService.account_sid, TwilioService.auth_token)
    end
  
    def call
      @client.messages.create(
        body: message_body,
        from: whatsapp(TwilioService.twilio_whatsapp_number),
        to: whatsapp(to_mobile_number)
      )
    end
  
    private
  
    def whatsapp(number)
      "whatsapp:#{number}"
    end
  end
  