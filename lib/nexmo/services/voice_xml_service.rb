module Nexmo
  class VoiceXmlService < BaseService
    define_action :make_calls, endpoint: '/call/json'
  end
end