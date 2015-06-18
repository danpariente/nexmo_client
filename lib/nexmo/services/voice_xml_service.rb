module Nexmo
  class VoiceXmlService < BaseService
    def make_calls(phone_numbers, params)
      connection.in_parallel do
        phone_numbers.each { |num| make_call(params.merge(to: num)) }
      end
    end

    def make_call(params)
      response = connection.post('/call/json', normalize_params(params))
    end
  end
end