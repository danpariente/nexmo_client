module Nexmo
  class AlertsService < BaseService
    define_action :send_messages, endpoint: '/sc/us/alert/json', handler: true
  end
end