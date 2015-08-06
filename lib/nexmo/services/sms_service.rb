module Nexmo
  class SmsService < BaseService
    define_action :send_messages, endpoint: '/sms/json', handler: true
  end
end