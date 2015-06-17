module Nexmo
  module Configuration
    VALID_CONNECTION_KEYS = [:endpoint, :user_agent, :concurrency].freeze
    VALID_OPTIONS_KEYS    = [:api_key, :api_secret, :format]
    VALID_CONFIG_KEYS     = VALID_CONNECTION_KEYS + VALID_OPTIONS_KEYS

    DEFAULT_ENDPOINT      = 'https://rest.nexmo.com'.freeze
    DEFAULT_USER_AGENT    = "Nexmo API Ruby Gem".freeze
    DEFAULT_CONCURRENCY   = 100

    DEFAULT_API_KEY       = 'a12f0648'
    DEFAULT_API_SECRET    = 'eac0a20e'
    DEFAULT_FORMAT        = :json

    attr_accessor *VALID_CONFIG_KEYS

    def self.extended(base)
      base.reset
    end

    def reset
      self.endpoint    = DEFAULT_ENDPOINT
      self.user_agent  = DEFAULT_USER_AGENT
      self.concurrency = DEFAULT_CONCURRENCY

      self.api_key     = DEFAULT_API_KEY
      self.api_secret  = DEFAULT_API_SECRET
      self.format      = DEFAULT_FORMAT
    end

    def options
      Hash[ * VALID_CONFIG_KEYS.map { |key| [key, send(key)] }.flatten ]
    end

    def connection_defaults
      {
        url: DEFAULT_ENDPOINT,
        headers: {
          user_agent: DEFAULT_USER_AGENT,
          content_type: "application/#{DEFAULT_FORMAT}"
        }
      }
    end

    def api_configuration
      {
        api_key: api_key,
        api_secret: api_secret
      }
    end

    def configure
      yield self
    end
  end
end
