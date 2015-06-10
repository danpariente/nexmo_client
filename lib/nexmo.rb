require "nexmo/version"
require 'active_support/all'

module Nexmo
  autoload :Client, 'nexmo/client'

  # Services
  autoload :BaseService, 'nexmo/services/base_service'
  autoload :SmsService, 'nexmo/services/sms_service'
  autoload :TextToSpeechService, 'nexmo/services/text_to_speech_service'
end
