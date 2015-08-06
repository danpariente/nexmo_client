module Nexmo
  class TextToSpeechService < BaseService
    define_action :make_calls, endpoint: 'tts/json'
  end
end