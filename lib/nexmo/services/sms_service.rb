module Nexmo
  class SmsService < BaseService
    def send_messages(phone_numbers, params)
      connection.in_parallel do
        phone_numbers.each { |num| send_message(params.merge(to: num)) }
      end
    end

    def send_message(params)
      response = connection.post('/sms/json', normalize_params(params))
      handle_response(response)
    end
  end
end