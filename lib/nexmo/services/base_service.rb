module Nexmo
  class BaseService
    attr_accessor :connection

    def initialize(connection)
      @connection = connection[:connection]
    end

    protected

    def handle_response(response)
      response = JSON.parse(response.body)['messages'].first if response.body
      response['status'].to_i.zero? ? response : raise(ServiceException, response['error-text'])
    end

    def normalize_params(params)
      params.reverse_merge!(defaults).to_json
    end

    def defaults
      {
        api_key: Nexmo::Client::KEY,
        api_secret: Nexmo::Client::SECRET
      }
    end
  end
  ServiceException = Class.new(StandardError)
end