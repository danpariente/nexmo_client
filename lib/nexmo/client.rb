require 'typhoeus'
require 'typhoeus/adapters/faraday'

module Nexmo
  class Client
    attr_reader :connection
    attr_accessor *Configuration::VALID_CONFIG_KEYS

    def initialize(options = {})
      setup_connection(options)
      @connection = Faraday.new(options) do |builder|
        builder.adapter :typhoeus
      end
    end

    def self.services
      {
        sms: SmsService,
        tts: TextToSpeechService,
        alerts: AlertsService
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

    def setup_connection(options)
      options.reverse_merge!(connection_options)
      Configuration::VALID_CONFIG_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    def connection_options
      Nexmo.connection_defaults.merge(parallel_manager: manager)
    end

    def manager
      Typhoeus::Hydra.new(max_concurrency: 100)
    end
  end
end
