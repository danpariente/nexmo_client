module Nexmo
  class BaseService
    attr_accessor :connection

    def initialize(connection)
      @connection = connection[:connection]
    end

    protected

    def self.define_action(name, options = {})
      endpoint = options.fetch(:endpoint)
      handler = options.fetch(:handler, false)
      define_method(name) do |phone_numbers, params|
        connection.in_parallel do
          phone_numbers.each do |num|
            response = connection.post(endpoint, normalize_params(params.merge(to: num)))
            handle_response(response) if handler
          end
        end
      end
    end

    def handle_response(response)
      response = JSON.parse(response.body)['messages'].first if response.body
      response['status'].to_i.zero? ? response : raise(ServiceException, response['error-text'])
    end

    def normalize_params(params)
      params.reverse_merge!(Nexmo.api_configuration).to_json
    end
  end
  ServiceException = Class.new(StandardError)
end
