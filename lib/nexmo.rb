require "nexmo/version"
require 'active_support/all'

module Nexmo
  autoload :Configuration, 'nexmo/configuration'
  autoload :Client, 'nexmo/client'

  # Services
  autoload :BaseService, 'nexmo/services/base_service'
  autoload :SmsService, 'nexmo/services/sms_service'
  autoload :AlertsService, 'nexmo/services/alerts_service'
  autoload :TextToSpeechService, 'nexmo/services/text_to_speech_service'
  autoload :VoiceXmlService, 'nexmo/services/voice_xml_service'

  # Configuration
  extend Configuration
end
