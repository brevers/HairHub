require_relative "../../app/services/twilio_service"

TwilioService.account_sid = ENV["TWILIO_ACCOUNT_SID"]
TwilioService.auth_token = ENV["TWILIO_ACCOUNT_TOKEN"]
TwilioService.twilio_number = ENV["TWILIO_PHONE_NUMBER"]
TwilioService.twilio_whatsapp_number = ENV["TWILIO_WHATSAPP_NUMBER"]
