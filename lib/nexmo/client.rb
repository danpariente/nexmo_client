require 'typhoeus'
require 'typhoeus/adapters/faraday'

module Nexmo
  class Client
    NEXMO_API = 'https://rest.nexmo.com'.freeze
    KEY = ENV['NEXMO_API_KEY']
    SECRET =  ENV['NEXMO_API_SECRET']

    attr_reader :connection
    attr_reader :host

    def initialize(host = nil)
      @host = host
      @connection = Faraday.new(connection_options) do |builder|
        builder.adapter :typhoeus
      end
    end

    def self.services
      {
        sms: SmsService,
        tts: TextToSpeechService
      }
    end

    def services
      @services ||= {}
    end

    def method_missing(name, *args, &block)
      if self.class.services.keys.include?(name)
        services[name] ||= self.class.services[name].new(connection: connection)
        services[name]
      else
        super
      end
    end

    private

    def connection_options
      {
        url: host || NEXMO_API,
        parallel_manager: manager,
        headers: {
          user_agent: 'Nexmo Ruby Client',
          content_type: 'application/json'
        }
      }
    end

    def manager
      Typhoeus::Hydra.new(max_concurrency: 100)
    end
  end
end
