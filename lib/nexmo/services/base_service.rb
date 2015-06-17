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
      params.reverse_merge!(Nexmo.api_defaults).to_json
    end
  end
  ServiceException = Class.new(StandardError)
end
